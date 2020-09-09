from django.shortcuts import render

from rest_framework import generics

from .serializers import UserAcctEvSerializar

from .models import UserAccountEvent

# Create your views here.

class UserEventCreate (generics.ListCreateAPIView):
    queryset = UserAccountEvent.objects.all()
    serializer_class = UserAcctEvSerializar

class UserEventList (generics.RetrieveUpdateDestroyAPIView):
    queryset = UserAccountEvent.objects.all()
    serializer_class = UserAcctEvSerializar

