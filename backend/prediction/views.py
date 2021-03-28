from django_filters.rest_framework import DjangoFilterBackend
from django_pandas.io import read_frame
from rest_framework import generics, status
from rest_framework.views import APIView
from rest_framework.response import Response
from django.shortcuts import render

from django.conf import settings

from .models import PredictionsModel
from .serializers import PredictionsSerializer
from .filters import PredictionsFilter
from .neurolnetwork.predict import get_predict

class PredictionsListView(generics.ListAPIView):
    queryset = PredictionsModel.objects.all()
    serializer_class = PredictionsSerializer
    filter_backends = (DjangoFilterBackend,)
    filterset_class = PredictionsFilter


class PredictionsMonthView(APIView):
    queryset = PredictionsModel.objects.all()

    def post(self, request):
        df = read_frame(self.queryset)
        rez = get_predict(request.data['month'], df)
        return Response(rez)


