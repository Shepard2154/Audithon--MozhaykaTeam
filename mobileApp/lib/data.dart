class Date {
  String from;
  String until;
}

Date date;
List<double> yValues1 = [
  134.35,
  133.29,
  137.21,
  136.56,
  140.35,
  142.33,
  147.55,
  150.60,
  153.01,
  163.81,
  183.92,
  193.97
];
List<double> yValues2 = [
  54.84,
  54.73,
  54.61,
  54.06,
  50.59,
  50.96,
  51.02,
  51.62,
  51.80,
  50.36,
  51.98,
  54.88
];
List<double> yValues3 = [
  189.19,
  188.02,
  191.82,
  190.62,
  190.94,
  193.29,
  198.57,
  202.22,
  204.81,
  214.17,
  235.90,
  248.85,
];
List<double> yValuesDinamic = yValues1;

String out =
    "Номинал:\nОбъем эмиссии, шт.:\nОбъем эмиссии:\nОбъем в обращении, шт:\nОбъем в обращении:\nПериод обращения, дней:\nДата начала размещения:\nДата окончания размещения:\nДата рег. отчета об итогах:\nДата погашения:\nДней до погашения:\nДюрация по Макколею, дней:\nПериодичность выплат в год:\nТекущий купон (всего):\nДата выплаты купона:\nРазмер купона, % годовых:\nНКД:";
String out_second =
    "1000 RUB\n350 000 000\n350 000 000 000 RUB\n339 422 797\n339 422 797 000 RUB\n2198\n21.02.2018\n25.12.2019\n28.02.2018\n28.02.2024\n1068\n986\n2\n7 (12)\n01.09.2021\n6,5\n4,27 RUB";