from django.urls import path

from . import views


urlpatterns = [
    path('debt/', views.DebtCBListView.as_view()),
    path('obligations/', views.ObligationListView.as_view()),
    path('outer/', views.OuterDebtListView.as_view()),

    path('outer/delete/<int:pk>/', views.OuterDebtDestroyView.as_view()),

    path('debt/plot/', views.DebtPlotView.as_view()),
    path('outer/plot/', views.OuterPlotView.as_view()),
]