from django.db import models
from datetime import datetime

from accounts.models import UserAccount
# Create your models here.
class Event(models.Model):
    title = models.CharField(max_length=120)
    description= models.CharField(max_length=120,blank=True,null=True)
    content= models.TextField(blank=True,null=True)
    date_event = models.DateTimeField(blank=True,null=True)
    date_created = models.DateTimeField(default=datetime.now, blank=True)
    costo = models.DecimalField(max_digits=5, decimal_places=2,null=True)
    url =  models.CharField(max_length=2048,null= True)
    thumbnail = models.ImageField(upload_to='photos/%Y/%m/%d/',blank=True,null=True)
    accounts= models.ManyToManyField(UserAccount,through="UserAccountEvent")# para la llave foránea
    def __str__(self):
        return self.title

class UserAccountEvent(models.Model):
    User_id = models.ForeignKey(
        UserAccount, 
        on_delete=models.CASCADE,
        blank=True, null=True
    )
    event_id = models.ForeignKey(
        Event, 
        on_delete=models.CASCADE,
        blank=True, null=True
    )
    date_created = models.DateTimeField(default=datetime.now, blank=True)