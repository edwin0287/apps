from django.shortcuts import render

from rest_framework import generics

from .serializers import UserAcctEvSerializar

from .models import UserAccountEvent


from rest_framework.permissions import IsAuthenticated

# Create your views here.

class UserEventCreate (generics.ListCreateAPIView):
    permission_classes = (IsAuthenticated,)
    queryset = UserAccountEvent.objects.all()
    serializer_class = UserAcctEvSerializar

class UserEventList (generics.RetrieveUpdateDestroyAPIView):
    queryset = UserAccountEvent.objects.all()
    serializer_class = UserAcctEvSerializar


class TicketListView(generics.ListAPIView):
    #permission_classes = (IsAuthenticated,)
    queryset = UserAccountEvent.objects.all()
    serializer_class = UserAcctEvSerializar



