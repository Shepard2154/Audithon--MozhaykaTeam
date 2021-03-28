from django_filters import rest_framework as filters

from .models import PredictionsModel


class PredictionsFilter(filters.FilterSet):
    class Meta:
        model = PredictionsModel
        fields = '__all__'