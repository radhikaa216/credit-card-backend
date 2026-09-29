from sqlalchemy import Column, Integer, Numeric, String, DateTime
from database import Base


class SavedCard(Base):
    __tablename__ = "cards_savedcard"

    id = Column(Integer, primary_key=True)
    user_id = Column(Integer, nullable=False)


class Transaction(Base):
    __tablename__ = "transactions_transaction"

    id = Column(Integer, primary_key=True, index=True)

    amount = Column(
        Numeric(10, 2),
        nullable=False
    )

    status = Column(
        String(10),
        nullable=False
    )

    created_at = Column(
        DateTime,
        nullable=False
    )

    updated_at = Column(
        DateTime,
        nullable=False
    )

    card_id = Column(
        Integer,
        nullable=False
    )

    user_id = Column(
        Integer,
        nullable=False
    )