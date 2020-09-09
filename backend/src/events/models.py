from django.db import models
from datetime import datetime

# Create your models here.
class Event(models.Model):
    title = models.CharField(max_length=120)
    content= models.TextField()
    date_event = models.DateTimeField(blank=True,null=True)
    date_created = models.DateTimeField(default=datetime.now, blank=True)
    costo = models.DecimalField(max_digits=5, decimal_places=2,null=True)

    def __str__(self):
        return self.title

