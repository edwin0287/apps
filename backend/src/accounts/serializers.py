from djoser.serializers import UserCreateSerializer, UserSerializer
from rest_framework import serializers
from django.contrib.auth import get_user_model
User = get_user_model()

from .models import UserAccountEvent

class UserCreateSerializer(UserCreateSerializer):
    class Meta(UserCreateSerializer.Meta):
        model = User
        fields = ('id', 'email', 'name', 'password')


class UserAcctEvSerializar(serializers.ModelSerializer):
    class Meta:
        model= UserAccountEvent
        fields = ('id', 'User_id', 'event_id')

    
      
