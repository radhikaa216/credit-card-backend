from django.test import TestCase
from rest_framework.test import APIClient
from django.contrib.auth.models import User


class AuthenticationTest(TestCase):

    def setUp(self):
        self.client = APIClient()

    def test_user_registration(self):

        data = {
            "username": "testuser",
            "email": "testuser@gmail.com",
            "first_name": "Test",
            "last_name": "User",
            "password": "Test@12345" }

        response = self.client.post("/api/register/",data,format="json" )
        self.assertEqual(response.status_code, 201)
        self.assertTrue(User.objects.filter(username="testuser").exists() )

    def test_user_login(self):

        User.objects.create_user( username="loginuser",  email="loginuser@gmail.com", password="Test@12345" )

        data = {
        "username": "loginuser",
        "password": "Test@12345"   }

        response = self.client.post("/api/login/", data, format="json" )

        self.assertEqual(response.status_code, 200)

        self.assertIn("access", response.data)
        self.assertIn("refresh", response.data)       

    def test_login_with_wrong_password(self):

        User.objects.create_user(username="wrongtest", email="wrongtest@gmail.com",password="Correct@12345")
        data = {"username": "wrongtest",
            "password": "Wrong@12345" }
        response = self.client.post( "/api/login/", data, format="json")
        self.assertEqual(response.status_code, 401)   

    def test_profile_without_token(self):
        response = self.client.get("/api/profile/")
        self.assertEqual(response.status_code, 401)

    def test_profile_with_valid_token(self):

        user = User.objects.create_user(username="profileuser",  email="profile@gmail.com",first_name="Profile",
            last_name="User",password="Test@12345")

        login_data = {
            "username": "profileuser",
            "password": "Test@12345"
        }

        login_response = self.client.post(
            "/api/login/",
            login_data,
            format="json" )

        access_token = login_response.data["access"]

        self.client.credentials(
            HTTP_AUTHORIZATION=f"Bearer {access_token}" )

        response = self.client.get("/api/profile/")

        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.data["username"], "profileuser")        
                