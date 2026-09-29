from pydantic import BaseModel, Field
from decimal import Decimal
from typing import Literal

class PaymentRequest(BaseModel):
    card_id: int = Field(gt=0)
    amount: Decimal = Field(gt=0)

class PaymentProcess(BaseModel):
    result: Literal["SUCCESS", "FAILED"]