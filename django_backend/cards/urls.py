from django.urls import path
from .views import AddCardView,SavedCardListView,DeleteCardView


urlpatterns = [path('add/', AddCardView.as_view(), name='add_card'),
                path('', SavedCardListView.as_view(), name='saved_cards'),
                 path('<int:card_id>/', DeleteCardView.as_view(), name='delete_card')]


