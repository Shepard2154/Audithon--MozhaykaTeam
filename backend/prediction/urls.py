from django.urls import path

from . import views


urlpatterns = [
    path("list/", views.PredictionsListView.as_view()),
    path("predict/", views.PredictionsMonthView.as_view())
]