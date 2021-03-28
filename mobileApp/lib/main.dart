import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rs_hack/screens/home.dart';
import 'package:rs_hack/screens/repay.dart';
import 'package:rs_hack/screens/analit.dart';
import 'package:rs_hack/styles.dart';
import 'package:rs_hack/widgets/nav_bar.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  BottomBar _currentTab = BottomBar.HOME;

  final _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return MaterialApp(
      theme: ThemeData.dark(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('ru', 'RU'),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Traveler App',
      home: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: CustomNavBar(
          currentTab: _currentTab,
          onTabClicked: (BottomBar tab) {
            setState(() {
              _currentTab = tab;
              _controller.animateToPage(tab.index,
                  duration: Duration(milliseconds: 300), curve: Curves.ease);
            });
          },
        ),
        body: PageView(
          physics: new NeverScrollableScrollPhysics(),
          controller: _controller,
          children: <Widget>[
            HomeScreen(),
            RepayScreen(),
            AnalitScreen(),
          ],
        ),
      ),
    );
  }
}
