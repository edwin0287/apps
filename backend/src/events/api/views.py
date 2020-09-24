from rest_framework.generics import ListAPIView,RetrieveAPIView,ListCreateAPIView,RetrieveUpdateDestroyAPIView
from events.models import Event,UserAccountEvent
from accounts.models import UserAccount
from .serializers import EventSerializer,EventSummarySerializer,UserAcctEvSerializar,EventTicketSerializer,EventVideoSerializer

from rest_framework.permissions import IsAuthenticated

import datetime

from django.db.models import Count
class EventListDateView(ListAPIView):
    nowdatetime = datetime.datetime.now()#obteniendo datetime actual
    queryset = Event.objects.order_by('date_event').filter(date_event__gte=nowdatetime)
    serializer_class = EventSummarySerializer


class EventListView(ListAPIView):
    queryset = Event.objects.all()
    serializer_class = EventSummarySerializer
   
   
class EventDetailView(RetrieveAPIView):
    queryset = Event.objects.all()
    serializer_class = EventSummarySerializer

class EventVideoDetailView(RetrieveAPIView):
    permission_classes = (IsAuthenticated,)
    queryset = Event.objects.all()
    serializer_class = EventVideoSerializer

#------------------------------models---------------------------

class UserEventCreate (ListCreateAPIView):
    permission_classes = (IsAuthenticated,)
    queryset = UserAccountEvent.objects.all()
    serializer_class = UserAcctEvSerializar

class UserEventList (RetrieveUpdateDestroyAPIView):
    queryset = UserAccountEvent.objects.all()
    serializer_class = UserAcctEvSerializar


class TicketEventListView(ListAPIView):
    serializer_class = EventSerializer
    def get_queryset(self):
        id= self.kwargs['User_id']
        return Event.objects.values('id','title','content','date_created','date_event','costo','description','url','thumbnail','category').annotate(count=Count('id')).filter(accounts__id__exact=id)
        #return user.event_set.all().order_by('date_event')

class TicketRelaListView(ListAPIView):
     #queryset = Event.objects.all()
     serializer_class = EventTicketSerializer
     def get_queryset(self):
         id= self.kwargs['User_id']
         user=UserAccount.objects.get(pk=id)
         query_set= user.event_set.all()
         return query_set
     
