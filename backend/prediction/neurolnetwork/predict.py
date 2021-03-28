from datetime import datetime

import pandas as pd
import numpy as np
import keras as k
import calendar
from sklearn.preprocessing import StandardScaler
from keras.models import load_model
import tensorflow as tf
from django.conf import settings

from tensorflow.python.keras.backend import set_session
from tensorflow.python.keras.models import load_model

session = tf.Session(graph=tf.Graph())
with session.graph.as_default():
    k.backend.set_session(session)
    model = load_model(settings.BASE_DIR.joinpath('prediction/neurolnetwork/models/vneshni_dolg.h5'))

graph = tf.get_default_graph()


def get_predict(n, frame):
    
    sc = StandardScaler()
    def add_months(sourcedate, months):
        month = sourcedate.month - 1 + months
        year = sourcedate.year + month // 12
        month = month % 12 + 1
        date = datetime.strptime('{}-{}-{}'.format(year,month,1), '%Y-%m-%d')
        return date
    
    dates = []
    date = frame['Time'][frame.index[-1]]
    frame = frame.drop(frame.columns[:3],axis=1)
    frame = frame.drop(frame.columns[-1],axis=1)
    dolg = []
    for i in range(n):
        frame = frame.append({'wwp':frame['wwp'][frame.index[-1]]*1.015,'index_selo':frame['index_selo'][frame.index[-1]]*1.015,
                          'transport':frame['transport'][frame.index[-1]]*1.015,'capital':frame['capital'][frame.index[-1]]*1.015,
                          'oborot':frame['oborot'][frame.index[-1]]*1.015,'kurs':frame['kurs'][frame.index[-1]]*1.012,
                          'roznica':frame['roznica'][frame.index[-1]]*1.015},ignore_index=True)
        data = sc.fit_transform(frame)
        with session.graph.as_default():
            k.backend.set_session(session)
            dolg.append(model.predict([[data[-3:]]]))
        date = add_months(date,1)
        dates.append(date)
    
    predication_month = pd.DataFrame()
    predication_month = frame.iloc[-n:]
    predication_month['All'] = [x[0][0] for x in dolg]
    predication_month['Time'] = dates

    rez = []
    for i in range(len(predication_month)):
        buf = {
            'Time':predication_month.iloc[i]['Time'],
            'All':predication_month.iloc[i]['All'],
            'wwp':predication_month.iloc[i]['wwp'],
            'index_selo':predication_month.iloc[i]['index_selo'],
            'transport':predication_month.iloc[i]['transport'],
            'capital':predication_month.iloc[i]['capital'],
            'oborot':predication_month.iloc[i]['oborot'],
            'kurs':predication_month.iloc[i]['kurs'],
            'roznica':predication_month.iloc[i]['roznica'],
        }
        rez.append(buf)
    
    return rez