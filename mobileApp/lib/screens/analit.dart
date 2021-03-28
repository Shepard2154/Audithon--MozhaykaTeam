import 'package:flutter/material.dart';
import 'package:rs_hack/styles.dart';
import 'package:rs_hack/widgets/chart.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:rs_hack/data.dart';
import 'package:flutter/services.dart';
import 'package:rs_hack/widgets/chart_3.dart';

class AnalitScreen extends StatefulWidget {
  @override
  _AnalitScreenState createState() => _AnalitScreenState();
}

class _AnalitScreenState extends State<AnalitScreen> {
  double perText;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    setState(() {
      widget.createState();
    });

    return Column(
      children: <Widget>[
        Align(
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(33)),
              gradient: new LinearGradient(
                  colors: [
                    Colors.white,
                    kColorBlue,
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.5, 1.0),
                  stops: [0.0, 0.65],
                  tileMode: TileMode.decal),
            ),
            margin:
                EdgeInsets.only(top: 45, left: 25.0, right: 15.0, bottom: 0),
            alignment: Alignment.topLeft,
            child: Text(
              'Прогноз Государственного Долга',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 36,
                color: Colors.black.withAlpha(200),
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.only(top: 50, left: 15.0, right: 15.0, bottom: 20),
          height: 490,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: BarChartSample5(),
        )
      ],
    );
  }
}
