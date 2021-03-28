from rest_framework import serializers


class PricePlotSerializer(serializers.Serializer):
    c = serializers.FloatField()
    h = serializers.FloatField()
    l = serializers.FloatField()
    o = serializers.FloatField()
    time = serializers.DateTimeField()
