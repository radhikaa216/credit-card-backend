# Credit Card Payment System - Backend

A backend application for managing users, saved cards, payments, transactions, and administrative operations.

The project uses **Django REST Framework** for authentication, card management, transaction management, and admin features. **FastAPI** is used for payment processing.

---

# Technologies Used

- Python
- Django
- Django REST Framework
- FastAPI
- MySQL
- SQLAlchemy
- JWT Authentication
- Pytest
- Django TestCase
- Swagger / OpenAPI
- Postman
- Docker
- Docker Compose

---

# Project Structure

```text
creditcard_payments/
│
├── django_backend/
│   ├── accounts/
│   ├── cards/
│   ├── transactions/
│   ├── config/
│   ├── manage.py
│   ├── requirements.txt
│   └── Dockerfile
│
├── fastapi_backend/
│   ├── routes/
│   ├── main.py
│   ├── auth.py
│   ├── database.py
│   ├── models.py
│   ├── schemas.py
│   ├── tests.py
│   ├── requirements.txt
│   └── Dockerfile
│
├── database/
│   └── credit_card_payment_db.sql
│
├── postman/
│   └── Credit_Card_Payment_System_API.postman_collection.json
│
├── screenshots/
│
├── docker-compose.yml
├── .gitignore
└── README.md
```

---

# Features

## Authentication

The authentication system provides:

- User registration
- User login
- JWT authentication
- Protected API endpoints
- Secure password hashing
- User logout

---

## Card Management

Users can:

- Add a credit/debit card
- View their saved cards
- Delete their own cards

For security:

- CVV is not stored
- Full card numbers are not stored
- Only masked card information and the last four digits are stored
- Users cannot access another user's saved cards

---

## Payment Processing

Payment processing is handled using **FastAPI**.

Payment flow:

```text
Create Payment
      ↓
   PENDING
      ↓
Process Payment
      ↓
SUCCESS / FAILED
```

The payment API also verifies that the selected card belongs to the authenticated user.

---

## Transaction Management

The Django backend provides:

- Transaction history
- Filter transactions by date
- Filter transactions by amount
- Filter transactions by status
- Admin CSV export

---

## Admin Features

Administrative functionality includes:

- Manage users
- View saved cards
- View transactions
- View daily payment summaries
- Export transaction information as CSV

Django's built-in `django_admin_log` table records administrative actions.

Admin-only API operations are protected so that normal users cannot access them.

---

# Database

The project uses **MySQL**.

Database name:

```text
credit_card_payment_db
```

Main tables include:

```text
Users
Saved Cards
Transactions
Django Admin Logs
```

The Django migration system is used for database table creation and management.

A MySQL database dump is included in:

```text
database/credit_card_payment_db.sql
```

---

# Security

The application implements the following security measures:

- JWT authentication
- Password hashing
- Protected API endpoints
- No CVV storage
- No full card-number storage
- User/card ownership validation
- Input validation
- ORM-based database access
- Environment variables for database credentials and secret values
- `.env` files excluded from Git

Sensitive information such as passwords, JWT tokens, secret keys, and database credentials should not be committed to the repository.

---

# Environment Variables

Create the required `.env` files locally.

Example database configuration:

```env
DB_USER=root
DB_PASSWORD=your_mysql_password
DB_HOST=localhost
DB_PORT=3306
DB_NAME=credit_card_payment_db
```

FastAPI also requires the Django secret key used by the authentication integration:

```env
DJANGO_SECRET_KEY=your_secret_key
```

Do not commit `.env` files to GitHub.

---

# Local Setup

## 1. Clone Repository

```bash
git clone <repository-url>
cd creditcard_payments
```

Replace `<repository-url>` with the actual GitHub repository URL.

---

## 2. Django Setup

Navigate to the Django backend:

```bash
cd django_backend
```

Create a virtual environment:

```bash
python -m venv venv
```

Activate it on Windows:

```bash
venv\Scripts\activate
```

Install dependencies:

```bash
pip install -r requirements.txt
```

Configure the `.env` file.

Run migrations:

```bash
python manage.py migrate
```

Start Django:

```bash
python manage.py runserver
```

Django runs at:

```text
http://127.0.0.1:8000/
```

---

## 3. FastAPI Setup

Open another terminal and navigate to:

```bash
cd fastapi_backend
```

Create a virtual environment:

```bash
python -m venv venv
```

Activate it:

```bash
venv\Scripts\activate
```

Install dependencies:

```bash
pip install -r requirements.txt
```

Configure the FastAPI `.env` file.

Start FastAPI:

```bash
python -m uvicorn main:app --port 8001
```

FastAPI runs at:

```text
http://127.0.0.1:8001/
```

---

# API Documentation

## Django API Documentation

Django REST Framework API documentation is generated using `drf-spectacular`.

Swagger UI:

```text
http://127.0.0.1:8000/api/docs/
```

OpenAPI schema:

```text
http://127.0.0.1:8000/api/schema/
```

---

## FastAPI Documentation

FastAPI provides Swagger/OpenAPI documentation automatically.

Swagger UI:

```text
http://127.0.0.1:8001/docs
```

The Swagger interface can be used to view and test the FastAPI payment endpoints.

---

# API Overview

## Django APIs

The Django backend provides APIs for:

- User registration
- Login and JWT authentication
- Logout
- Card management
- Transaction history
- Transaction filtering
- CSV export
- Daily payment summary

Important tested endpoints include:

```text
POST   /api/register/
POST   /api/login/
POST   /api/cards/add/
GET    /api/cards/
DELETE /api/cards/<id>/
GET    /api/transactions/
GET    /api/transactions/export/
GET    /api/admin/daily-summary/
```

Transaction history supports filtering by:

```text
/api/transactions/?status=SUCCESS
/api/transactions/?amount=1000
/api/transactions/?date=YYYY-MM-DD
```

Filters can also be combined as query parameters.

---

## FastAPI APIs

The FastAPI service handles payment processing.

Payment creation initially creates a transaction with:

```text
PENDING
```

Payment processing then updates the transaction to:

```text
SUCCESS
```

or:

```text
FAILED
```

---

# Postman Collection

A Postman collection is included for API testing.

Location:

```text
postman/Credit_Card_Payment_System_API.postman_collection.json
```

The collection contains requests for:

- Register User
- Login
- Add Card
- Saved Cards
- Delete Card
- Transaction History
- Admin CSV Export
- Daily Payment Summary

Passwords in the exported collection are replaced with placeholder values, and authentication tokens are not stored in the collection.

JWT access tokens can be generated using the Login API and added through Postman's **Authorization → Bearer Token** option when testing protected endpoints.

---

# Testing

The project contains automated tests for authentication, card management, and payment processing.

## Authentication

Tests verify authentication and protected functionality.

## Card Management

Tests include:

- Add card
- Card masking
- View saved cards
- Prevent viewing another user's card
- Delete own card
- Prevent deleting another user's card

## Payment Processing

FastAPI payment tests include:

- Create payment with `PENDING` status
- Process payment with `SUCCESS` status
- Process payment with `FAILED` status
- Reject payment using another user's card

---

## Run Django Tests

From `django_backend`:

```bash
python manage.py test
```

---

## Run FastAPI Tests

From `fastapi_backend`:

```bash
pytest tests.py -v
```

---

# Test Coverage

The project requirement specifies a minimum test coverage of:

```text
50%
```

Current measured Django test coverage:

```text
82%
```

Coverage can be checked using:

```bash
coverage run --source=. manage.py test
coverage report
```

To generate the HTML coverage report:

```bash
coverage html
```

---

# Docker

Docker configuration is provided for:

- Django
- FastAPI
- MySQL

Docker Compose is used to configure the services together.

Build containers:

```bash
docker compose build
```

Start containers:

```bash
docker compose up -d
```

Check containers:

```bash
docker compose ps
```

Run Django migrations inside Docker:

```bash
docker compose run --rm django python manage.py migrate
```

Stop containers:

```bash
docker compose down
```

> Docker configuration has been added to the project. Complete environment-specific Docker runtime verification before deployment.

---

# Screenshots

Screenshots can be stored inside:

```text
screenshots/
```

Recommended submission screenshots include:

- Django registration API
- Login and JWT authentication
- Card creation
- Saved card listing
- Card deletion
- FastAPI payment creation
- Payment SUCCESS/FAILED processing
- Transaction history
- Transaction filters
- CSV export
- Daily payment summary
- Django Admin
- Admin logs
- Django Swagger documentation
- FastAPI Swagger documentation
- Automated test results
- 82% coverage report

Docker screenshots should only be included after Docker runtime verification has been completed successfully.

---

# Admin Credentials

Admin credentials should be provided separately to the evaluator if required.

For security reasons, real passwords should **not** be stored in the public repository.

A new Django admin account can be created using:

```bash
python manage.py createsuperuser
```

---

# Submission Items

The project submission contains:

- GitHub Repository
- MySQL Database Dump
- Postman Collection
- Required Screenshots
- Admin Credentials

---

# Project Status

## Completed

- Django REST Framework backend
- FastAPI payment service
- User registration and login
- JWT authentication and authorization
- Card management
- Secure card masking
- Payment processing
- Transaction history
- Date, amount, and status filtering
- Django Admin
- Admin authorization
- CSV transaction export
- Daily payment summary
- Security validation
- Automated Django testing
- FastAPI payment testing
- 82% Django test coverage
- Django Swagger/OpenAPI documentation
- FastAPI Swagger documentation
- Docker configuration
- MySQL database dump
- Postman collection export

## Remaining Verification

- Final screenshot organization
- Docker runtime verification

---

# Notes

This project was developed as a backend implementation of a **Credit Card Payment System** using Django REST Framework and FastAPI.

The application demonstrates authentication, authorization, secure card storage, payment processing, transaction management, administrative operations, API documentation, automated testing, database backup, and API testing through Postman.
