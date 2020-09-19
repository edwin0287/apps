from rest_framework import serializers
from events.models import Event
from events.models import UserAccountEvent

class EventSerializer(serializers.ModelSerializer):
    class Meta:
        model = Event
        fields= ('id','title','content','date_event','costo','description','url','thumbnail')

class EventSummarySerializer(serializers.ModelSerializer):
    class Meta:
        model = Event
        fields= ('id','title','content','date_event','costo','description','thumbnail')

class UserAcctEvSerializar(serializers.ModelSerializer):
    class Meta:
        model= UserAccountEvent
        fields = ('id', 'User_id', 'event_id','date_created')


#--------------------------relationships-------------------

class EventTicketSerializer(serializers.ModelSerializer):

    accounts = UserAcctEvSerializar(many=True, read_only=True,source='useraccountevent_set')
    class Meta:
        model = Event
        fields = ('id','title','content','date_event','costo','accounts',)
