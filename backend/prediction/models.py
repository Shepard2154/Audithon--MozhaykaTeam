from django.db import models

class PredictionsModel(models.Model):
    Time = models.DateField()
    All = models.FloatField()
    wwp = models.FloatField()
    index_selo = models.FloatField()
    transport = models.FloatField()
    capital = models.FloatField()
    oborot = models.FloatField()
    kurs = models.FloatField()
    roznica = models.FloatField()
    ronya = models.FloatField()

# Create your models here.
