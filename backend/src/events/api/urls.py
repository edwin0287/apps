from django.urls import path

from .views  import EventListView, EventDetailView,EventListDateView,UserEventCreate,TicketEventListView#,TicketListView

urlpatterns = [
    path('',EventListView.as_view()),
    path('event/',EventListDateView.as_view()),
    path('<pk>',EventDetailView.as_view()),
    #path('ticket/list/<User_id>',TicketListView.as_view()),
    path('ticket/event/<User_id>',TicketEventListView.as_view()),
    path('ticket/',UserEventCreate.as_view()),
]
