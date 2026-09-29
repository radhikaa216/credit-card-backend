from django.db import models
from django.contrib.auth.models import User
from cards.models import SavedCard


class Transaction(models.Model):

    STATUS_CHOICES = [
        ('PENDING', 'Pending'),
        ('SUCCESS', 'Success'),
        ('FAILED', 'Failed'),
    ]

    user = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name='transactions'
    )

    card = models.ForeignKey(
        SavedCard,
        on_delete=models.PROTECT,
        related_name='transactions'
    )

    amount = models.DecimalField(
        max_digits=10,
        decimal_places=2
    )

    status = models.CharField(
        max_length=10,
        choices=STATUS_CHOICES,
        default='PENDING'
    )

    created_at = models.DateTimeField(
        auto_now_add=True
    )

    updated_at = models.DateTimeField(
        auto_now=True
    )

    def __str__(self):
        return f"Transaction {self.id} - {self.status}"