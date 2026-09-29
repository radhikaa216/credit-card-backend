from fastapi import FastAPI, Depends
from sqlalchemy import text
from routes import payments
from database import engine
from auth import get_current_user

app = FastAPI()

app.include_router(payments.router)

@app.get("/")
def home():
    return {"message": "Credit Card Payment API is running"}


@app.get("/database-test")
def database_test():

    with engine.connect() as connection:
        result = connection.execute(text("SELECT DATABASE()"))
        database_name = result.scalar()

    return {
        "message": "Database connected successfully",
        "database": database_name
    }



@app.get("/auth-test")
def auth_test(user_id: int = Depends(get_current_user)):

    return {
        "message": "Token verified successfully",
        "user_id": user_id
    }

