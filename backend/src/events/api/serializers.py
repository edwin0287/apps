from rest_framework import serializers
from events.models import Event

from events.models import UserAccountEvent

class EventSerializer(serializers.ModelSerializer):
    class Meta:
        model = Event
        fields= ('id','title','content','date_event','costo')


class UserAcctEvSerializar(serializers.ModelSerializer):
    class Meta:
        model= UserAccountEvent
        fields = ('id', 'User_id', 'event_id')
