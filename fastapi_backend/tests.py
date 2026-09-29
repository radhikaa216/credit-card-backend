from fastapi.testclient import TestClient
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy.pool import StaticPool

from main import app
from database import Base
from routes.payments import get_db
from auth import get_current_user
from models import SavedCard, Transaction


# Create temporary SQLite database for testing
TEST_DATABASE_URL = "sqlite://"

test_engine = create_engine(
    TEST_DATABASE_URL,
    connect_args={"check_same_thread": False},
    poolclass=StaticPool
)

TestingSessionLocal = sessionmaker(
    autocommit=False,
    autoflush=False,
    bind=test_engine
)

Base.metadata.create_all(bind=test_engine)


# Test database dependency
def override_get_db():

    db = TestingSessionLocal()

    try:
        yield db
    finally:
        db.close()


# Pretend user ID 4 is logged in
def override_get_current_user():
    return 4


app.dependency_overrides[get_db] = override_get_db
app.dependency_overrides[get_current_user] = override_get_current_user


client = TestClient(app)


def test_create_payment_pending():

    db = TestingSessionLocal()

    # Remove old test data
    db.query(SavedCard).delete()
    db.commit()

    # Create a card belonging to user 4
    card = SavedCard(
    id=1,
    user_id=4
)

    db.add(card)
    db.commit()
    db.close()

    response = client.post(
        "/payments/",
        json={
            "card_id": 1,
            "amount": 1000
        }
    )

    assert response.status_code == 200

    data = response.json()

    assert data["status"] == "PENDING"


def test_process_payment_success():

    db = TestingSessionLocal()

    db.query(Transaction).delete()
    db.query(SavedCard).delete()
    db.commit()

    card = SavedCard(
        id=1,
        user_id=4
    )

    db.add(card)
    db.commit()
    db.close()

    # First create the payment
    create_response = client.post(
        "/payments/",
        json={
            "card_id": 1,
            "amount": 2000
        }
    )

    assert create_response.status_code == 200

    transaction_id = create_response.json()["transaction_id"]

    # Now process the payment
    response = client.put(
        f"/payments/{transaction_id}/process/",
        json={
            "result": "SUCCESS"
        }
    )

    assert response.status_code == 200

    data = response.json()

    assert data["status"] == "SUCCESS"    


def test_process_payment_failed():

    db = TestingSessionLocal()

    db.query(Transaction).delete()
    db.query(SavedCard).delete()
    db.commit()

    card = SavedCard(
        id=1,
        user_id=4
    )

    db.add(card)
    db.commit()
    db.close()

    # Create payment
    create_response = client.post(
        "/payments/",
        json={
            "card_id": 1,
            "amount": 1500
        }
    )

    assert create_response.status_code == 200

    transaction_id = create_response.json()["transaction_id"]

    # Process payment as FAILED
    response = client.put(
        f"/payments/{transaction_id}/process/",
        json={
            "result": "FAILED"
        }
    )

    assert response.status_code == 200

    data = response.json()

    assert data["status"] == "FAILED"

def test_payment_with_another_users_card():

    db = TestingSessionLocal()

    db.query(Transaction).delete()
    db.query(SavedCard).delete()
    db.commit()

    # This card belongs to user 5
    card = SavedCard(
        id=1,
        user_id=5
    )

    db.add(card)
    db.commit()
    db.close()

    # Logged-in user is user 4
    response = client.post(
        "/payments/",
        json={
            "card_id": 1,
            "amount": 1000
        }
    )

    assert response.status_code == 404

    assert response.json()["detail"] == "Card not found for this user"        