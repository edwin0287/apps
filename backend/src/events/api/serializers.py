from rest_framework import serializers
from events.models import Event
from events.models import UserAccountEvent
from django.db.models import Count

class EventSerializer(serializers.ModelSerializer):
    count = serializers.IntegerField()
    thumbnail= serializers.CharField()
    class Meta:
        model = Event
        fields= ('id','title','content','date_created','date_event','costo','description','url','thumbnail','category','count')
    
class EventVideoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Event
        fields= ('id','title','content','date_event','costo','description','url','thumbnail','category')
 
class EventSummarySerializer(serializers.ModelSerializer):
    class Meta:
        model = Event
        fields= ('id','title','content','date_event','costo','description','thumbnail','category')

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
