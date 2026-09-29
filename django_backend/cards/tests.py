from django.test import TestCase
from django.contrib.auth.models import User
from rest_framework.test import APIClient
from rest_framework_simplejwt.tokens import RefreshToken

from .models import SavedCard


class CardManagementTest(TestCase):

    def setUp(self):

        self.user = User.objects.create_user(
            username="carduser",
            email="carduser@gmail.com",
            password="Test@12345"
        )

        self.client = APIClient()

        refresh = RefreshToken.for_user(self.user)
        access_token = str(refresh.access_token)

        self.client.credentials(
            HTTP_AUTHORIZATION=f"Bearer {access_token}"
        )

    def test_add_card(self):

        data = {
            "card_holder_name": "Test User",
            "card_type": "CREDIT",
            "card_number": "1234567812345678",
            "expiry_month": 12,
            "expiry_year": 2030
        }

        response = self.client.post(
            "/api/cards/add/",
            data,
            format="json"
        )

        self.assertEqual(response.status_code, 201)

        self.assertEqual(
            SavedCard.objects.count(),
            1
        )


    def test_card_number_is_masked(self):

        data = {
            "card_holder_name": "Test User",
            "card_type": "CREDIT",
            "card_number": "1234567812345678",
            "expiry_month": 12,
            "expiry_year": 2030
        }

        response = self.client.post(
            "/api/cards/add/",
            data,
            format="json"
        )

        self.assertEqual(response.status_code, 201)

        card = SavedCard.objects.first()

        self.assertEqual(
            card.last_four,
            "5678"
        )

        self.assertEqual(card.masked_card, "************5678")
                     
         
        

    def test_view_saved_cards(self):

        SavedCard.objects.create(
            user=self.user,
            card_holder_name="Test User",
            card_type="CREDIT",
            masked_card="************5678",
            last_four="5678",
            expiry_month=12,
            expiry_year=2030
        )

        response = self.client.get(
            "/api/cards/"
        )

        self.assertEqual(response.status_code, 200)

        self.assertEqual(
            len(response.data),1)
        
    def test_user_cannot_view_another_users_card(self):

        other_user = User.objects.create_user(
            username="otheruser",
            email="otheruser@gmail.com",
            password="Test@12345"
        )

        SavedCard.objects.create(
            user=other_user,
            card_holder_name="Other User",
            card_type="DEBIT",
            masked_card="************4444",
            last_four="4444",
            expiry_month=10,
            expiry_year=2030)

        response = self.client.get("/api/cards/" )

        self.assertEqual(response.status_code, 200)

        self.assertEqual(len(response.data),0)

    def test_delete_own_card(self):

        card = SavedCard.objects.create(
            user=self.user,
            card_holder_name="Test User",
            card_type="CREDIT",
            masked_card="************5678",
            last_four="5678",
            expiry_month=12,
            expiry_year=2030 )
        response = self.client.delete( f"/api/cards/{card.id}/" )
        self.assertEqual(response.status_code, 200)
        self.assertFalse(SavedCard.objects.filter(id=card.id).exists())    

    def test_cannot_delete_another_users_card(self):

        other_user = User.objects.create_user(
            username="otheruser",
            email="otheruser@gmail.com",
            password="Test@12345" )
       
        other_card = SavedCard.objects.create(
            user=other_user,
            card_holder_name="Other User",
            card_type="DEBIT",
            masked_card="************4444",
            last_four="4444",
            expiry_month=10,
            expiry_year=2030 )
        response = self.client.delete(f"/api/cards/{other_card.id}/" )    
        self.assertIn(response.status_code,[403, 404] )
        self.assertTrue(SavedCard.objects.filter(id=other_card.id).exists() )
                    
       

      
        
