from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import IsAuthenticated
from .models import SavedCard
from .serializers import SavedCardSerializer


class AddCardView(APIView):

    permission_classes = [IsAuthenticated]

    def post(self, request):

        serializer = SavedCardSerializer(data=request.data)

        if serializer.is_valid():

            serializer.save(user=request.user)

            return Response(
                serializer.data,
                status=status.HTTP_201_CREATED
            )

        return Response(
            serializer.errors,
            status=status.HTTP_400_BAD_REQUEST)



class SavedCardListView(APIView):

    permission_classes = [IsAuthenticated]

    def get(self, request):

        cards = SavedCard.objects.filter(user=request.user)

        serializer = SavedCardSerializer(cards, many=True)

        return Response(
            serializer.data,
            status=status.HTTP_200_OK
        )    



class DeleteCardView(APIView):

    permission_classes = [IsAuthenticated]

    def delete(self, request, card_id):

        try:
            card = SavedCard.objects.get(
                id=card_id,
                user=request.user
            )

        except SavedCard.DoesNotExist:
            return Response(
                {"message": "Card not found"},
                status=status.HTTP_404_NOT_FOUND
            )

        card.delete()

        return Response(
            {"message": "Card deleted successfully"},
            status=status.HTTP_200_OK
        )    
        
