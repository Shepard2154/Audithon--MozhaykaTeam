import 'package:flutter/material.dart';
import 'package:rs_hack/styles.dart';
import 'package:rs_hack/widgets/chart.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:rs_hack/data.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double perText;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    setState(() {
      perText =
          (((yValuesDinamic[yValuesDinamic.length - 1] - yValuesDinamic[0]) /
                  yValuesDinamic[yValuesDinamic.length - 1]) *
              100);
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
                    kColorOrange,
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
              'Аналитика Государственного Долга',
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
            margin:
                EdgeInsets.only(top: 50, left: 15.0, right: 15.0, bottom: 20),
            height: 260,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.black.withAlpha(220),
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 50,
                      height: 25,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          width: 180,
                          child: CustomRadioButton(
                            defaultSelected: "Внешний",
                            elevation: 0,
                            buttonTextStyle: ButtonTextStyle(
                              selectedColor: Colors.white,
                              unSelectedColor: Colors.white,
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 18,
                              ),
                            ),
                            unSelectedColor: kColorGray.withAlpha(50),
                            buttonLables: [
                              "Внешний    ",
                              "Внутренний ",
                              "Общий      ",
                            ],
                            buttonValues: [
                              "Внешний",
                              "Внутренний",
                              "Общий",
                            ],
                            radioButtonValue: (value) {
                              if (value == "Внешний") yValuesDinamic = yValues1;
                              if (value == "Внутренний")
                                yValuesDinamic = yValues2;
                              if (value == "Общий") yValuesDinamic = yValues3;

                              perText =
                                  (((yValuesDinamic[yValuesDinamic.length - 1] -
                                              yValuesDinamic[0]) /
                                          yValuesDinamic[
                                              yValuesDinamic.length - 1]) *
                                      100);

                              setState(() {
                                widget.createState();
                              });
                            },
                            spacing: 30,
                            horizontal: false,
                            enableButtonWrap: true,
                            height: 50,
                            width: 160,
                            absoluteZeroSpacing: false,
                            enableShape: true,
                            unSelectedBorderColor: Colors.transparent,
                            selectedBorderColor: Colors.transparent,
                            selectedColor: kColorOrange,
                            padding: 30,
                          ),
                        ))
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 180,
                      height: 40,
                      child: Align(
                          alignment: Alignment.centerLeft, child: Container()),
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                            margin: EdgeInsets.only(right: 10, top: 30),
                            padding: EdgeInsets.only(left: 0),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                            width: 180,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Text(
                                          yValuesDinamic[
                                                      yValuesDinamic.length - 1]
                                                  .toString() +
                                              " " +
                                              '\$',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 34,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 0,
                                              left: 3.0,
                                              right: 0,
                                              bottom: 5),
                                          child: Text(
                                            "(МЛРД)",
                                            style: TextStyle(
                                              color:
                                                  Colors.white.withAlpha(200),
                                              fontWeight: FontWeight.w300,
                                              fontSize: 12,
                                            ),
                                          ),
                                        )
                                      ],
                                    )),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                        padding: EdgeInsets.only(
                                            left: 5, top: 3, bottom: 5),
                                        width: 70,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              width: 40,
                                              child: Flexible(
                                                child: RichText(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  strutStyle: StrutStyle(
                                                      fontSize: 16.0),
                                                  text: TextSpan(
                                                      style: TextStyle(
                                                          color: Colors
                                                              .red.shade600),
                                                      text: perText.toString()),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 0, top: 0),
                                              margin: EdgeInsets.only(
                                                  top: 0,
                                                  left: 0,
                                                  right: 0,
                                                  bottom: 0),
                                              child: Text(
                                                "%",
                                                style: TextStyle(
                                                  color: Colors.red.shade600,
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            )
                                          ],
                                        ))),
                              ],
                            ))),
                    Container(
                      margin: EdgeInsets.only(
                          top: 20, left: 0.0, right: 50, bottom: 5),
                      width: 150,
                      height: 50,
                      child: CustomRadioButton(
                        defaultSelected: "1",
                        elevation: 0,
                        buttonTextStyle: ButtonTextStyle(
                          selectedColor: Colors.white,
                          unSelectedColor: kColorGray,
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        unSelectedColor: Colors.transparent,
                        buttonLables: [
                          "1Г",
                          "3Г",
                          "5Л",
                        ],
                        buttonValues: [
                          "1",
                          "5",
                          "10",
                        ],
                        radioButtonValue: (value) {
                          perText = (((yValuesDinamic[
                                          yValuesDinamic.length - 1] -
                                      yValuesDinamic[0]) /
                                  yValuesDinamic[yValuesDinamic.length - 1]) *
                              100);

                          setState(() {
                            widget.createState();
                          });
                        },
                        spacing: 0,
                        horizontal: false,
                        enableButtonWrap: false,
                        height: 50,
                        width: 50,
                        absoluteZeroSpacing: true,
                        enableShape: false,
                        unSelectedBorderColor: Colors.transparent,
                        selectedBorderColor: Colors.transparent,
                        selectedColor: Colors.transparent,
                        padding: 0,
                      ),
                    )
                  ],
                ),
              ],
            ))),
        Container(
            margin: EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 0),
            height: 230,
            width: MediaQuery.of(context).size.width,
            child: Column(children: <Widget>[LineChartSample2()]))
      ],
    );
  }
}
