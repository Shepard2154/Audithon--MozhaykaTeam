import re

from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import generics, status
from rest_framework.response import Response

from docs.models import ObligationModel
from .serializers import PricePlotSerializer
from .services import get_ofz_figi_by_number, get_ofz_candle, get_bond_url, get_bond_data


class ObligationPriceView(generics.RetrieveAPIView):
    queryset = ObligationModel.objects.all()
    serializer_class = PricePlotSerializer

    def get_data(self, figi):
        data = get_ofz_candle(figi)
        if not data:
            return Response('No candle for this paper', status=status.HTTP_204_NO_CONTENT)
        serializer = self.get_serializer(data[-1])
        return Response(serializer.data)

    def retrieve(self, request, *args, **kwargs):
        name = self.get_object().name
        number = re.findall(r'\d+', name)[0]
        figi = get_ofz_figi_by_number(number)
        if figi is None:
            return Response('No figi for this paper', status=status.HTTP_204_NO_CONTENT)
        return self.get_data(figi)


class ObligationPlotView(ObligationPriceView):
    def get_data(self, figi):
        data = get_ofz_candle(figi)
        serializer = self.get_serializer(data, many=True)
        return Response(serializer.data)


class DetailBondView(generics.RetrieveAPIView):
    queryset = ObligationModel.objects.all()

    def retrieve(self, request, *args, **kwargs):
        o = self.get_object()
        url = get_bond_url(o)
        if url is None:
            return Response("Can't find this paper", status=status.HTTP_204_NO_CONTENT)
        return Response(get_bond_data(url), status=status.HTTP_200_OK)