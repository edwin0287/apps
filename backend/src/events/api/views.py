from rest_framework.generics import ListAPIView,RetrieveAPIView
from events.models import Event
from .serializers import EventSerializer

from rest_framework.permissions import IsAuthenticated

import datetime

class EventListDateView(ListAPIView):
    permission_classes = (IsAuthenticated,)
    nowdatetime = datetime.datetime.now()#obteniendo datetime actual
    queryset = Event.objects.order_by('date_event').filter(date_event__gte=nowdatetime)
    serializer_class = EventSerializer


class EventListView(ListAPIView):
    permission_classes = (IsAuthenticated,)
    queryset = Event.objects.all()
    serializer_class = EventSerializer
   
   

class EventDetailView(RetrieveAPIView):
    permission_classes = (IsAuthenticated,)
    queryset = Event.objects.all()
    serializer_class = EventSerializer
