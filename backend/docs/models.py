from django.db import models


class DebtCBModel(models.Model):
    date = models.DateField()
    type = models.TextField()
    debt = models.FloatField()


class ObligationModel(models.Model):
    date = models.DateField()
    name = models.TextField()
    kind = models.TextField()
    percent = models.FloatField()
    cost = models.IntegerField()
    pation_id = models.IntegerField()


class OuterDebtModel(models.Model):
    date = models.DateField()
    name = models.TextField()
    usd = models.FloatField()
    eu = models.FloatField()


class DolgModel(models.Model):
    date = models.DateField()
    total = models.FloatField()
    usd = models.FloatField()