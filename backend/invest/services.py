from datetime import datetime
import re
from string import Template

import requests
from bs4 import BeautifulSoup as Bs

from openapi_client import openapi
from openapi_genclient.models.candle import Candle

from django.conf import settings


client = openapi.api_client(settings.TINKOFF_APIKEY)

def get_ofz_figi_by_number(number: int) -> str:
    bonds = client.market.market_bonds_get().payload.instruments
    ofz = list(filter(lambda x: 'ОФЗ' in x.name, bonds))
    for i in ofz:
        if str(number) in i.name:
            return i.figi
    return None

def get_ofz_candle(figi: int) -> Candle:
    to = datetime.now()
    _from = to.replace(year = to.year - 1)
    return client.market.market_candles_get(
        figi = figi,
        _from = _from.isoformat() + '+03:00', 
        to = to.isoformat() + '+03:00',
        interval = 'month'
    ).payload.candles

def get_bond_url(o) -> str:
    URL_MASK = Template('https://www.rusbonds.ru/srch_simple.asp?go=1&nick=%CE%D4%C7-$number-%CF%C4')

    number = re.findall(r'\d+', o.name)[0]
    url = URL_MASK.substitute(number = number)

    data = Bs(requests.get(url).text)

    obligation_url = ''
    for link in data.body.find_all('a'):
        href = link.get('href')
        if str(href).startswith('/ank'):
            return f'https://www.rusbonds.ru{href}'
    return None

def get_bond_data(url) -> dict:
    req = requests.get(url)
    req.encoding = 'cp1251'
    data = Bs(req.text).body
    
    rez = dict()
    for tr in data.find("table", {"class": "tbl_data"}).find_all('tr'):
        points = tr.find_all('td')
        if len(points) == 2:
            key, val = points
            rez[key.text] = val.text
    return rez