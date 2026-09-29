from django.db import models
from django.contrib.auth.models import User

class SavedCard(models.Model):

    CARD_TYPES = [
        ('CREDIT', 'Credit Card'),
        ('DEBIT', 'Debit Card'),
    ]

    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='saved_cards')

    card_holder_name = models.CharField(max_length=100)

    card_type = models.CharField(max_length=10,choices=CARD_TYPES)

    masked_card = models.CharField(max_length=19)

    last_four = models.CharField(max_length=4)

    expiry_month = models.PositiveSmallIntegerField()

    expiry_year = models.PositiveSmallIntegerField()

    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.card_type} - {self.masked_card}"