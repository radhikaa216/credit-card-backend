from rest_framework import serializers
from .models import SavedCard
from datetime import date
class SavedCardSerializer(serializers.ModelSerializer):
    card_number = serializers.CharField(
        write_only=True,
        min_length=13,
        max_length=19)
    
    class Meta:
        model = SavedCard
        fields = ['id','card_holder_name','card_type','card_number','masked_card','last_four','expiry_month',
                  'expiry_year','created_at']
        read_only_fields = ['id','masked_card','last_four','created_at']
        
    def validate_card_number(self, value):
        if not value.isdigit():
            raise serializers.ValidationError(
                "Card number must contain only digits."     )
        return value

    def validate_expiry_month(self, value):
        if value < 1 or value > 12:
            raise serializers.ValidationError(
                "Expiry month must be between 1 and 12." )
        return value

    def create(self, validated_data):
        card_number = validated_data.pop('card_number')
        last_four = card_number[-4:]
        masked_card = '*' * (len(card_number) - 4) + last_four
        saved_card = SavedCard.objects.create(masked_card=masked_card,last_four=last_four,**validated_data)
        return saved_card

    def validate(self, data):
        expiry_month = data.get('expiry_month')
        expiry_year = data.get('expiry_year')
        today = date.today()
        if expiry_year < today.year:
            raise serializers.ValidationError(  "Card has expired.")
        if expiry_year == today.year and expiry_month < today.month:
            raise serializers.ValidationError("Card has expired.")   
        return data    

       