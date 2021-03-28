import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:rs_hack/styles.dart';

class BarChartSample5 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BarChartSample5State();
}

class BarChartSample5State extends State<BarChartSample5> {
  static const double barWidth = 12;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.8,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: kColorBlue,
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.center,
              maxY: 20,
              minY: -20,
              groupsSpace: 12,
              barTouchData: BarTouchData(
                enabled: false,
              ),
              titlesData: FlTitlesData(
                show: true,
                topTitles: SideTitles(
                  showTitles: true,
                  getTextStyles: (value) =>
                      const TextStyle(color: Colors.white, fontSize: 10),
                  margin: 10,
                  rotateAngle: 0,
                  getTitles: (double value) {
                    switch (value.toInt()) {
                      case 0:
                        return 'Я';
                      case 1:
                        return 'Ф';
                      case 2:
                        return 'М';
                      case 3:
                        return 'А';
                      case 4:
                        return 'М';
                      case 5:
                        return 'И';
                      case 6:
                        return 'И';
                      case 7:
                        return 'А';
                      case 8:
                        return 'С';
                      case 9:
                        return 'О';
                      case 10:
                        return 'Н';
                      case 11:
                        return 'Д';
                      default:
                        return '';
                    }
                  },
                ),
                bottomTitles: SideTitles(
                  showTitles: true,
                  getTextStyles: (value) =>
                      const TextStyle(color: Colors.white, fontSize: 10),
                  margin: 10,
                  rotateAngle: 0,
                  getTitles: (double value) {
                    switch (value.toInt()) {
                      case 0:
                        return 'Я';
                      case 1:
                        return 'Ф';
                      case 2:
                        return 'М';
                      case 3:
                        return 'А';
                      case 4:
                        return 'М';
                      case 5:
                        return 'И';
                      case 6:
                        return 'И';
                      case 7:
                        return 'А';
                      case 8:
                        return 'С';
                      case 9:
                        return 'О';
                      case 10:
                        return 'Н';
                      case 11:
                        return 'Д';
                      default:
                        return '';
                    }
                  },
                ),
                leftTitles: SideTitles(
                  showTitles: false,
                  getTextStyles: (value) =>
                      const TextStyle(color: Colors.white, fontSize: 10),
                  rotateAngle: 45,
                  getTitles: (double value) {
                    if (value == 0) {
                      return '0';
                    }
                    return '${value.toInt()}0k';
                  },
                  interval: 5,
                  margin: 8,
                  reservedSize: 30,
                ),
                rightTitles: SideTitles(
                  showTitles: true,
                  getTextStyles: (value) =>
                      const TextStyle(color: Colors.white, fontSize: 10),
                  rotateAngle: 90,
                  getTitles: (double value) {
                    if (value == 0) {
                      return '0';
                    }
                    return '${value.toInt()}0k';
                  },
                  interval: 5,
                  margin: 8,
                  reservedSize: 30,
                ),
              ),
              gridData: FlGridData(
                show: true,
                checkToShowHorizontalLine: (value) => value % 5 == 0,
                getDrawingHorizontalLine: (value) {
                  if (value == 0) {
                    return FlLine(
                        color: const Color(0xff363753), strokeWidth: 3);
                  }
                  return FlLine(
                    color: const Color(0xff2a2747),
                    strokeWidth: 0.8,
                  );
                },
              ),
              borderData: FlBorderData(
                show: false,
              ),
              barGroups: [
                BarChartGroupData(
                  x: 0,
                  barRods: [
                    BarChartRodData(
                      y: 15.1,
                      width: barWidth,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(6)),
                      rodStackItems: [
                        BarChartRodStackItem(0, 5, const Color(0xffffdd80)),
                        BarChartRodStackItem(5, 15.5, const Color(0xff19bfff)),
                      ],
                    ),
                  ],
                ),
                BarChartGroupData(
                  x: 1,
                  barRods: [
                    BarChartRodData(
                      y: -14,
                      width: barWidth,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(6),
                          bottomRight: Radius.circular(6)),
                      rodStackItems: [
                        BarChartRodStackItem(0, -2, const Color(0xffffdd80)),
                        BarChartRodStackItem(-2, -14, const Color(0xff19bfff)),
                      ],
                    ),
                  ],
                ),
                BarChartGroupData(
                  x: 2,
                  barRods: [
                    BarChartRodData(
                      y: 13,
                      width: barWidth,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(6)),
                      rodStackItems: [
                        BarChartRodStackItem(0, 3.5, const Color(0xffffdd80)),
                        BarChartRodStackItem(3.5, 13, const Color(0xff19bfff)),
                      ],
                    ),
                  ],
                ),
                BarChartGroupData(
                  x: 3,
                  barRods: [
                    BarChartRodData(
                      y: 13.5,
                      width: barWidth,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(6)),
                      rodStackItems: [
                        BarChartRodStackItem(0, 7, const Color(0xffffdd80)),
                        BarChartRodStackItem(7, 13.5, const Color(0xff19bfff)),
                      ],
                    ),
                  ],
                ),
                BarChartGroupData(
                  x: 4,
                  barRods: [
                    BarChartRodData(
                      y: -18,
                      width: barWidth,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(6),
                          bottomRight: Radius.circular(6)),
                      rodStackItems: [
                        BarChartRodStackItem(0, -9, const Color(0xffffdd80)),
                        BarChartRodStackItem(-9, -18, const Color(0xff19bfff)),
                      ],
                    ),
                  ],
                ),
                BarChartGroupData(
                  x: 5,
                  barRods: [
                    BarChartRodData(
                      y: -17,
                      width: barWidth,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(6),
                          bottomRight: Radius.circular(6)),
                      rodStackItems: [
                        BarChartRodStackItem(0, -7, const Color(0xffffdd80)),
                        BarChartRodStackItem(-7, -17, const Color(0xff19bfff)),
                      ],
                    ),
                  ],
                ),
                BarChartGroupData(x: 6, barRods: [
                  BarChartRodData(
                    y: 17,
                    width: barWidth,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(6)),
                    rodStackItems: [
                      BarChartRodStackItem(0, 6, const Color(0xffffdd80)),
                      BarChartRodStackItem(6, 17, const Color(0xff19bfff)),
                    ],
                  ),
                ]),
                BarChartGroupData(x: 7, barRods: [
                  BarChartRodData(
                    y: 19,
                    width: barWidth,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(6)),
                    rodStackItems: [
                      BarChartRodStackItem(0, 12, const Color(0xffffdd80)),
                      BarChartRodStackItem(12, 19, const Color(0xff19bfff)),
                    ],
                  ),
                ]),
                BarChartGroupData(x: 8, barRods: [
                  BarChartRodData(
                    y: 17,
                    width: barWidth,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(6)),
                    rodStackItems: [
                      BarChartRodStackItem(0, 4, const Color(0xffffdd80)),
                      BarChartRodStackItem(4, 17, const Color(0xff19bfff)),
                    ],
                  ),
                ]),
                BarChartGroupData(x: 9, barRods: [
                  BarChartRodData(
                    y: -14,
                    width: barWidth,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(6)),
                    rodStackItems: [
                      BarChartRodStackItem(0, -3, const Color(0xffffdd80)),
                      BarChartRodStackItem(-3, -14, const Color(0xff19bfff)),
                    ],
                  ),
                ]),
                BarChartGroupData(x: 10, barRods: [
                  BarChartRodData(
                    y: -18,
                    width: barWidth,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(6)),
                    rodStackItems: [
                      BarChartRodStackItem(0, -6, const Color(0xffffdd80)),
                      BarChartRodStackItem(-6, -18, const Color(0xff19bfff)),
                    ],
                  ),
                ]),
                BarChartGroupData(x: 11, barRods: [
                  BarChartRodData(
                    y: 15,
                    width: barWidth,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(6)),
                    rodStackItems: [
                      BarChartRodStackItem(0, 7, const Color(0xffffdd80)),
                      BarChartRodStackItem(7, 15, const Color(0xff19bfff)),
                    ],
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
