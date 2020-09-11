from django.shortcuts import render

from rest_framework import generics

from .serializers import UserAcctEvSerializar

from .models import UserAccountEvent,UserAccount


from rest_framework.permissions import IsAuthenticated

class UserEventCreate (generics.ListCreateAPIView):
    permission_classes = (IsAuthenticated,)
    queryset = UserAccountEvent.objects.all()
    serializer_class = UserAcctEvSerializar

class UserEventList (generics.RetrieveUpdateDestroyAPIView):
    queryset = UserAccountEvent.objects.all()
    serializer_class = UserAcctEvSerializar


class TicketListView(generics.ListAPIView):
    #permission_classes = (IsAuthenticated,)
    serializer_class = UserAcctEvSerializar
    def get_queryset(self):
        urs_id = self.kwargs['User_id']
        tk = UserAccountEvent.objects.filter(User_id__exact=urs_id)
        lista=[]
        for k in tk:
            print(k)
            lista.append(k)
        return lista#UserAccountEvent.objects.filter(User_id__exact=urs_id)

    




