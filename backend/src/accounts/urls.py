from django.urls import path

from .views  import UserEventCreate,UserEventList,TicketListView

urlpatterns = [
    path('',UserEventCreate.as_view()),
    path('list/<User_id>',TicketListView.as_view()),
]
