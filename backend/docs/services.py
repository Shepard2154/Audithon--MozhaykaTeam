from datetime import datetime

from loguru import logger

from django.db.models.functions import TruncMonth, Lag
from django.db.models import Sum, F, Window


def get_months_plot(queryset, field) -> list:
    return queryset.annotate(month=TruncMonth('date__month'))\
        .values('month').annotate(c=Sum(field)).values('month', 'c')\
            .annotate(prev=Window(Lag('c'))).annotate(repayment=F('c')-F('prev'))\
                .values('month', 'c', 'repayment')