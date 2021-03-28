import 'package:flutter/material.dart';
import 'package:rs_hack/styles.dart';

enum BottomBar { HOME, EVENTS, ANALIT }

class CustomNavBar extends StatelessWidget {
  Function onTabClicked;
  BottomBar currentTab;

  CustomNavBar({this.onTabClicked, this.currentTab});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CustomNavBarItem(
            type: BottomBar.HOME,
            isActive: currentTab == BottomBar.HOME,
            onTabClicked: onTabClicked,
          ),
          CustomNavBarItem(
            type: BottomBar.EVENTS,
            isActive: currentTab == BottomBar.EVENTS,
            onTabClicked: onTabClicked,
          ),
          CustomNavBarItem(
            type: BottomBar.ANALIT,
            isActive: currentTab == BottomBar.ANALIT,
            onTabClicked: onTabClicked,
          ),
        ],
      ),
    );
  }
}

class CustomNavBarItem extends StatelessWidget {
  BottomBar type;
  bool isActive;
  bool isHome;
  Function onTabClicked;

  CustomNavBarItem({this.type, this.isActive, this.onTabClicked, this.isHome});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (type == BottomBar.HOME) kColorDin = kColorOrange;
        if (type == BottomBar.EVENTS) kColorDin = kColorPurp;
        if (type == BottomBar.ANALIT) kColorDin = kColorBlue;

        onTabClicked(type);
      },
      child: AnimatedContainer(
        width: isActive
            ? MediaQuery.of(context).size.width * 0.5
            : MediaQuery.of(context).size.width * 0.2,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isActive ? kColorDin : Colors.transparent,
        ),
        duration: Duration(milliseconds: 300),
        curve: Curves.linear,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      getIcon(),
                      color: isActive ? Colors.white : Colors.grey,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Visibility(
                      visible: isActive,
                      child: Text(
                        getTitle(),
                        style: kSectionTitleTextStyle.copyWith(
                          color: isActive ? Colors.white : Colors.grey,
                        ),
                      ),
                    )
                  ])),
        ),
      ),
    );
  }

  IconData getIcon() {
    switch (type) {
      case BottomBar.HOME:
        return Icons.broken_image_outlined;
      case BottomBar.EVENTS:
        return Icons.broken_image_outlined;
      case BottomBar.ANALIT:
        return Icons.broken_image_outlined;
    }
  }

  String getTitle() {
    switch (type) {
      case BottomBar.HOME:
        return "Общее";
      case BottomBar.EVENTS:
        return "Погашение";
      case BottomBar.ANALIT:
        return "Прогноз";
    }
  }
}
