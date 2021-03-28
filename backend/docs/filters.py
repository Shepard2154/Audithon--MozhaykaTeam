from django_filters import rest_framework as filters

from .models import DebtCBModel, ObligationModel, OuterDebtModel


class DebtCBFilter(filters.FilterSet):
    date = filters.DateFromToRangeFilter()
    notype = filters.CharFilter(field_name='type', method='exclude_field')

    def exclude_field(self, queryset, name, value):
        return queryset.exclude(type=value)

    class Meta:
        model = DebtCBModel
        fields = '__all__'


class ObligationFilter(filters.FilterSet):
    date = filters.DateFromToRangeFilter()
    class Meta:
        model = ObligationModel
        fields = '__all__'


class OuterDebtFilter(filters.FilterSet):
    date = filters.DateFromToRangeFilter()
    name = filters.CharFilter(lookup_expr='icontains')
    class Meta:
        model = OuterDebtModel
        fields = '__all__'