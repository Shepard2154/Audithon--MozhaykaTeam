import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:rs_hack/styles.dart';
import 'package:rs_hack/data.dart';

class LineChartSample2 extends StatefulWidget {
  final weekDays = [
    'Январь',
    'Февраль',
    'Март',
    'Апрель',
    'Май',
    'Июнь',
    'Июль',
    'Август',
    'Сентябрь',
    'Октябрь',
    'Ноябрь',
    'Декабрь'
  ];

  List<double> yValues = yValuesDinamic;
  @override
  _LineChartSample2State createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    kColorOrange,
    kColorOrange,
  ];

  bool showAvg = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 2,
          child: Container(
            decoration: const BoxDecoration(color: Colors.transparent),
            child: Padding(
              padding:
                  const EdgeInsets.only(right: 0, left: 0, top: 24, bottom: 12),
              child: LineChart(
                mainData(),
                swapAnimationDuration: Duration(milliseconds: 500),
              ),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData mainData() {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: kColorOrange,
            getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
              return touchedBarSpots.map((barSpot) {
                final flSpot = barSpot;
                if (flSpot.x == 0 || flSpot.x == 10) {
                  return null;
                }

                return LineTooltipItem(
                  '${widget.weekDays[flSpot.x.toInt()]} \n${flSpot.y} МЛРД',
                  const TextStyle(color: Colors.white),
                );
              }).toList();
            }),
      ),
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(show: false),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 0,
      maxX: widget.yValues.length.toDouble() - 1,
      minY: widget.yValues[6] - widget.yValues[6] * 0.2,
      maxY: widget.yValues[6] + widget.yValues[6] * 0.2,
      lineBarsData: [
        LineChartBarData(
          spots: widget.yValues.asMap().entries.map((e) {
            return FlSpot(e.key.toDouble(), e.value);
          }).toList(),
          isCurved: true,
          colors: gradientColors,
          barWidth: 3,
          isStrokeCapRound: false,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors: [
              kColorOrange.withOpacity(0.5),
              kColorOrange.withOpacity(0.0),
            ],
            gradientColorStops: [0.5, 1.0],
            gradientFrom: const Offset(0, 0),
            gradientTo: const Offset(0, 1),
          ),
        ),
      ],
    );
  }
}
