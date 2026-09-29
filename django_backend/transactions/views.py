from django.utils import timezone
from django.db.models import Sum
import csv
from django.http import HttpResponse
from rest_framework.permissions import IsAuthenticated,IsAdminUser
from datetime import datetime
from decimal import Decimal, InvalidOperation
from rest_framework import status
from rest_framework.views import APIView
from rest_framework.response import Response

from .models import Transaction
from .serializers import TransactionSerializer


class TransactionHistoryView(APIView):

    permission_classes = [IsAuthenticated]

    def get(self, request):
        transactions = Transaction.objects.filter(
        user=request.user)

        status_value = request.query_params.get("status")

        if status_value:
            status_value = status_value.upper()

            if status_value not in ["PENDING", "SUCCESS", "FAILED"]:
                return Response(
                        {"message": "Invalid status"},
                        status=status.HTTP_400_BAD_REQUEST)

            transactions = transactions.filter(
            status=status_value)


        amount = request.query_params.get("amount")

        if amount:
            try:
                amount = Decimal(amount)

                if amount <= 0:
                    return Response( {"message": "Amount must be greater than 0"}, status=status.HTTP_400_BAD_REQUEST)
                                                 
            except InvalidOperation:
                    return Response(
                        {"message": "Invalid amount"},
                        status=status.HTTP_400_BAD_REQUEST)         
            transactions = transactions.filter(  amount=amount)
                            
        date = request.query_params.get("date")

        if date:
            try:
                datetime.strptime(date, "%Y-%m-%d")

            except ValueError:
                 return Response({"message": "Date must be YYYY-MM-DD"},status=status.HTTP_400_BAD_REQUEST)
            
            transactions = transactions.filter(created_at__date=date)
        
        transactions = transactions.order_by("-created_at")


class TransactionCSVExportView(APIView):

    permission_classes = [IsAdminUser]

    def get(self, request):

        transactions = Transaction.objects.all().order_by("-created_at")

        response = HttpResponse(content_type="text/csv")

        response["Content-Disposition"] = (
            'attachment; filename="transactions.csv"'
        )

        writer = csv.writer(response)

        writer.writerow([
            "Transaction ID",
            "Username",
            "Card ID",
            "Amount",
            "Status",
            "Created At"
        ])

        for transaction in transactions:
            writer.writerow([
                transaction.id,
                transaction.user.username,
                transaction.card_id,
                transaction.amount,
                transaction.status,
                transaction.created_at
            ])
        return response


class DailyPaymentSummaryView(APIView):

    permission_classes = [IsAdminUser]
    def get(self, request):
        today = timezone.localdate()
        transactions = Transaction.objects.filter(created_at__date=today)
        total_transactions = transactions.count() 
        successful_transactions = transactions.filter(status="SUCCESS" )
        failed_transactions = transactions.filter(status="FAILED").count()
        pending_transactions = transactions.filter(status="PENDING").count()
        total_successful_amount = successful_transactions.aggregate(total=Sum("amount"))["total"] or 0  
        return Response({"date": today,
                        "total_transactions": total_transactions,
                        "successful_transactions": successful_transactions.count(),
                        "failed_transactions": failed_transactions,
                        "pending_transactions": pending_transactions,
                        "total_successful_amount": total_successful_amount })
                   

          
            

            