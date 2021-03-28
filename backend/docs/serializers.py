from rest_framework import serializers

from .models import DebtCBModel, ObligationModel, OuterDebtModel


class PlotSerializer(serializers.Serializer):
    month = serializers.DateField()
    c = serializers.FloatField()
    repayment = serializers.FloatField()


class DebtCBSerializer(serializers.ModelSerializer):
    class Meta:
        model = DebtCBModel
        fields = '__all__'


class ObligationSerializer(serializers.ModelSerializer):
    class Meta:
        model = ObligationModel
        fields = '__all__'


class OuterDebtSerializer(serializers.ModelSerializer):
    class Meta:
        model = OuterDebtModel
        fields = '__all__'