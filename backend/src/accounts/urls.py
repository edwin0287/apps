from django.urls import path

from .views  import UserEventCreate,UserEventList,TicketListView

urlpatterns = [
    path('',UserEventCreate.as_view()),
    path('list/',TicketListView.as_view()),
]
