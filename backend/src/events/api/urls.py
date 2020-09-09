from django.urls import path

from .views  import EventListView, EventDetailView,EventListDateView

urlpatterns = [
    path('',EventListView.as_view()),
    path('event/',EventListDateView.as_view()),
    path('<pk>',EventDetailView.as_view())
]
