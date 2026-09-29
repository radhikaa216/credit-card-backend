from fastapi import APIRouter, Depends,HTTPException
from sqlalchemy.orm import Session
from schemas import PaymentRequest, PaymentProcess
from models import SavedCard, Transaction
from database import SessionLocal
from datetime import datetime
from auth import get_current_user
router = APIRouter()
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
       
@router.post("/payments/")
def make_payment(
    payment: PaymentRequest,
    user_id: int = Depends(get_current_user),
    db: Session = Depends(get_db)):
    card = db.query(SavedCard).filter(
        SavedCard.id == payment.card_id,
        SavedCard.user_id == user_id ).first()

    if card is None:
        raise HTTPException(
            status_code=404,
            detail="Card not found for this user")

    new_transaction = Transaction(
        user_id=user_id,
        card_id=payment.card_id,
        amount=payment.amount,
        status="PENDING",
        created_at=datetime.now(),
        updated_at=datetime.now())

    db.add(new_transaction)
    db.commit()
    db.refresh(new_transaction)

    return {
        "message": "Payment created",
        "transaction_id": new_transaction.id,
        "amount": new_transaction.amount,
        "status": new_transaction.status}


@router.put("/payments/{transaction_id}/process/")
def process_payment(
    transaction_id: int,
    payment_result: PaymentProcess,
    user_id: int = Depends(get_current_user),
    db: Session = Depends(get_db)):

    transaction = db.query(Transaction).filter(
        Transaction.id == transaction_id,
        Transaction.user_id == user_id).first()

    if transaction is None:
        raise HTTPException(
            status_code=404,
            detail="Transaction not found" )
    if transaction.status != "PENDING":
        raise HTTPException(
            status_code=400,
            detail="Transaction already processed")

    if payment_result.result not in ["SUCCESS", "FAILED"]:
        raise HTTPException(
            status_code=400,
            detail="Result must be SUCCESS or FAILED")
    transaction.status = payment_result.result
    transaction.updated_at = datetime.now()
    db.commit()
    db.refresh(transaction)
    return {
        "message": "Payment processed",
        "transaction_id": transaction.id,
        "amount": transaction.amount,
        "status": transaction.status }