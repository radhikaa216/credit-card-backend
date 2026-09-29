from django.urls import path
from .views import TransactionHistoryView,TransactionCSVExportView,DailyPaymentSummaryView


urlpatterns = [path("transactions/",TransactionHistoryView.as_view(),name="transaction-history"),
               path("transactions/export/",TransactionCSVExportView.as_view(),name="transaction-export"),
               path("admin/daily-summary/",DailyPaymentSummaryView.as_view(),name="daily-payment-summary")]