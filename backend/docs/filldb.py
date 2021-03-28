import os
import re
from datetime import datetime

import pandas as pd
from loguru import logger

from django.conf import settings
from .models import DebtCBModel, ObligationModel, OuterDebtModel
from prediction.models import PredictionsModel


def _month_to_int(month: str):
    month = month.lower()
    if month=='января': return 1
    if month=='февраля': return 2
    if month=='марта': return 3
    if month=='апреля': return 4
    if month=='мая': return 5
    if month=='июня': return 6
    if month=='июля': return 7
    if month=='августа': return 8
    if month=='сентября': return 9
    if month=='октября': return 10
    if month=='ноября': return 11
    if month=='декабря': return 12
    
def to_datetime(date: str) -> datetime:
    if '/' in date:
        date = date.split('/')
        day, month, year = int(date[0]), int(date[1]), int('20'+date[2])

    else:
        date = date.split()
        day = int(date[0])
        month = int(_month_to_int(date[1]))
        year = int(date[2])

    hours = date[-1].split(':')
    if int(hours[0]) == int(date[2]): hours = [0, 0]

    response = datetime(year, month, day, int(hours[0]), int(hours[1]))
    return response

def fill_DebtCBModel(filename: str, test=False):
    xl = pd.ExcelFile(filename)
    df1 = xl.parse('Лист1')

    rez = []
    for i in df1.fillna(0).T.to_dict().values():
        if i.get('Виды ценных бумаг'):
            buf = {'date': i.get('Виды ценных бумаг').lstrip('на ')}
            for a, b in i.items():
                if a != 'Виды ценных бумаг' and a != 'Итого внутренний долг':
                    if b and b != '-':
                        buf['type'] = a
                        buf['debt'] = b
                        rez.append(buf)
                        buf = {'date': i.get('Виды ценных бумаг').lstrip('на ')}

    for i in rez:
        date = datetime.strptime(i['date'], '%d.%m.%Y').date()
        if not test:
            DebtCBModel(date=date,type=i['type'],debt=i['debt']).save()
        else:
            logger.debug(i)
    if rez:
        logger.success('OK')

def fill_DebtCountrieModel(filename: str, type:str, test=False):
    xl = pd.ExcelFile(filename)
    df1 = xl.parse('год-млрд.руб.')

    rez = []
    for i in df1.values:
        rez.append({
            'date': datetime.strptime(i[0].strip(), '%d.%m.%Y').date(),
            'type': type,
            'debt': int(i[2] * 1000000000)
        })
    
    for i in rez:
        if not test:
            DebtCBModel(date=i['date'],type=i['type'],debt=i['debt']).save()
        else:
            logger.debug(i)
    if rez:
        logger.success('OK')

def fill_ObligationModel(filename: str, test=False):
    xl = pd.ExcelFile(filename)
    df1 = xl.parse('Лист1')
    
    vip = None
    rez = []
    for i in df1.values:
        if isinstance(i[1], str):
            if 'Выпуск' in i[1]:
                vip = i[1]
                continue
            if 'ИТОГО' in i[1]: 
                continue
        
        buf = dict()
        if vip and isinstance(i[1], int):
            buf['name'] = vip
            buf['kind'] = 'ОФЗ-ПД'
            buf['pation_id'] = i[1]
            buf['date'] = i[2].date()
            buf['percent'] = float(i[4])
            buf['cost'] = int(i[6])
            rez.append(buf)

    for i in rez:
        if not test:
            ObligationModel(
                name = i['name'],
                kind = i['kind'],
                pation_id = i['pation_id'],
                date = i['date'],
                percent = i['percent'],
                cost = i['cost']
            ).save()
        else:
            logger.debug(i)
    if rez:
        logger.success('OK')

def fill_OuterDebtModel(filename: str, test=False):
    xl = pd.ExcelFile(filename)
    sheets = xl.sheet_names

    for sheet in sheets:
        df1 = xl.parse(sheet).fillna(0)

        date = to_datetime(sheet.strip()).date()

        rez = []
        for i in df1.values:
            buf = dict()
            if isinstance(i[0], str) and '*' not in i[0] and 'Категория' not in i[0]:
                if not i[1] or not i[2]: continue
                buf['name'] = re.sub(" +", " ", i[0].strip())
                buf['USD'] = i[1]
                buf['EU'] = i[2]
                buf['date'] = date
                rez.append(buf)

        for i in rez:
            if not test:
                OuterDebtModel(
                    name = i['name'],
                    usd = i['USD'],
                    eu = i['EU'],
                    date = i['date']
                ).save()
            else:
                logger.debug(i)
        if rez:
            logger.success('OK')

def fill_Guarantee(filename: str, test=False):
    xl = pd.ExcelFile(filename)
    sheets = xl.sheet_names

    for sheet in sheets:
        df1 = xl.parse(sheet)

        dates = df1.values[2][2:]
        values = df1.fillna(0).values[-1][2:]

        rez = []
        for i in range(len(values)):
            if isinstance(values[i], float) and values[i]:
                if isinstance(dates[i], str):
                    date = datetime.strptime(dates[i].strip(), '%d.%m.%Y').date()
                if isinstance(dates[i], (datetime, pd._tslib.Timestamp)):
                    date = dates[i].date()
                buf = {
                    'type': 'guarantee',
                    'debt': values[i],
                    'date': date
                }
                rez.append(buf)

        for i in rez:
            if not test:
                DebtCBModel(date=i['date'],type=i['type'],debt=i['debt']).save()
            else:
                logger.debug(i)
        logger.success('OK')

def fill_predictions(filename: str, test=False):
    df = pd.read_csv(filename)
    df['Time'] = pd.to_datetime(df['Time'])
    rez = []
    for i in range(len(df)):
        buf = {
            'Time':df.iloc[i]['Time'],
            'All':df.iloc[i]['All'],
            'wwp':df.iloc[i]['wwp'],
            'index_selo':df.iloc[i]['index_selo'],
            'transport':df.iloc[i]['transport'],
            'capital':df.iloc[i]['capital'],
            'oborot':df.iloc[i]['oborot'],
            'kurs':df.iloc[i]['kurs'],
            'roznica':df.iloc[i]['roznica'],
            'ronya':df.iloc[i]['ronya']
        }
        rez.append(buf)

    for i in rez:
        if not test:
            PredictionsModel(Time=i['Time'],All=i['All'],wwp=i['wwp'],
                index_selo=i['index_selo'],transport=i['transport'],capital=i['capital'],
                oborot=i['oborot'],kurs=i['kurs'],roznica=i['roznica'],
                ronya=i['ronya']).save()
        else:
            logger.debug(i)
    logger.success('OK')
    

def fill():
    fill_DebtCountrieModel('Объем_внутреннего_долга_с_гарантиями_1.xls', type='domestic')
    fill_Guarantee('Объем_внутреннего_долга_с_гарантиями_2.xls')
    fill_ObligationModel('Параметры_выпусков_облигаций_ОФЗ_13_11_2020.xlsx')
    fill_DebtCBModel('Объем внутреннего долга в ЦБ 1.xlsx')
    fill_DebtCBModel('Объем внутреннего долга в ЦБ 2.xlsx')
    fill_predictions('base.csv')

    for i in list(filter(lambda x: x.startswith('20'), os.listdir())):
        dirname = settings.BASE_DIR.joinpath(i)
        for file in os.listdir(dirname):
            filename = settings.BASE_DIR.joinpath(i).joinpath(file)
            fill_OuterDebtModel(filename)

# fill()