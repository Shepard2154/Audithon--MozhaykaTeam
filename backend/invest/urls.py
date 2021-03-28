from django.urls import path

from . import views


urlpatterns = [
    path('<int:pk>/', views.ObligationPriceView.as_view()),
    path('plot/<int:pk>/', views.ObligationPlotView.as_view()),
    path('detail/<int:pk>/', views.DetailBondView.as_view()),
]