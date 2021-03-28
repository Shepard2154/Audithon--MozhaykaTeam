from rest_framework import serializers

from .models import PredictionsModel


class PredictionsSerializer(serializers.ModelSerializer):
    class Meta:
        model = PredictionsModel
        fields = '__all__'