from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import generics, status
from rest_framework.response import Response

from .models import DebtCBModel, ObligationModel, OuterDebtModel
from .serializers import DebtCBSerializer, ObligationSerializer, OuterDebtSerializer, PlotSerializer
from .filters import DebtCBFilter, ObligationFilter, OuterDebtFilter
from .services import get_months_plot

from .filldb import *


class DebtCBListView(generics.ListAPIView):
    queryset = DebtCBModel.objects.all().order_by('date')
    serializer_class = DebtCBSerializer
    filter_backends = (DjangoFilterBackend,)
    filterset_class = DebtCBFilter


class ObligationListView(generics.ListAPIView):
    queryset = ObligationModel.objects.all().order_by('date')
    serializer_class = ObligationSerializer
    filter_backends = (DjangoFilterBackend,)
    filterset_class = ObligationFilter


class OuterDebtListView(generics.ListAPIView):
    queryset = OuterDebtModel.objects.all().order_by('date')
    serializer_class = OuterDebtSerializer
    filter_backends = (DjangoFilterBackend,)
    filterset_class = OuterDebtFilter


class OuterDebtDestroyView(generics.DestroyAPIView):
    queryset = OuterDebtModel.objects.all()
    serializer_class = OuterDebtSerializer


class DebtPlotView(generics.ListAPIView):
    queryset = DebtCBModel.objects.all().order_by('date')
    serializer_class = PlotSerializer
    filter_backends = (DjangoFilterBackend,)
    filterset_class = DebtCBFilter
    sum_field = 'debt'

    def list(self, request):
        queryset = self.filter_queryset(self.get_queryset())
        queryset = get_months_plot(queryset, self.sum_field)
        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)


class OuterPlotView(DebtPlotView):
    queryset = OuterDebtModel.objects.all().order_by('date')
    filterset_class = OuterDebtFilter
    sum_field = 'usd'