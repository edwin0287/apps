from django.urls import path

from .views  import UserEventCreate

urlpatterns = [
    path('',UserEventCreate.as_view()),
]
