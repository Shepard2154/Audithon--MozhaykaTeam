import 'package:flutter/material.dart';
import 'package:rs_hack/data.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'package:rs_hack/repay/fake_data.dart';
import 'package:rs_hack/repay/styles.dart';
import 'package:rs_hack/repay/models.dart';
import 'package:rs_hack/repay/custom_rect_tween.dart';
import 'package:rs_hack/repay/hero_dialog_route.dart';
import 'package:rs_hack/styles.dart';
import 'package:rs_hack/widgets/chart_2.dart';

class RepayScreen extends StatefulWidget {
  @override
  _RepayScreenState createState() => _RepayScreenState();
}

class _RepayScreenState extends State<RepayScreen> {
  double perText;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

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
                    kColorPurp,
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
              'Погашение Государственного Долга',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 36,
                color: Colors.black.withAlpha(210),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 35, left: 20.0, right: 20.0, bottom: 0),
          height: 250,
          width: MediaQuery.of(context).size.width,
          child: BarChartSample2(),
        ),
        Container(
          child: Row(
            children: <Widget>[
              Container(
                width: 360,
                margin: EdgeInsets.only(
                    top: 15, left: 25.0, right: 20.0, bottom: 0),
                decoration: BoxDecoration(
                  // border: Border.all(color: kColorPurp, width: 3),
                  color: kColorPurp.withAlpha(220),
                  borderRadius: BorderRadius.all(Radius.circular(33)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(2),
                      margin: EdgeInsets.only(
                          top: 0, left: 0, right: 8.0, bottom: 0),
                      width: 60,
                      height: 260,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 10),
                        color: kColorPurp,
                        borderRadius: BorderRadius.all(Radius.circular(28)),
                      ),
                      child: Center(
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            "Облигации",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(
                              top: 1, left: 1, right: 1, bottom: 0),
                          height: 200,
                          width: 290,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: _TodoListContent(
                            todos: fakeData,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(
                              top: 8, left: 5, right: 0, bottom: 3),
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            // border: Border.all(color: Colors.white, width: 3),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.search,
                                size: 20,
                                color: kColorGray,
                              ),
                              Text(
                                ' ' + 'Поиск',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: kColorGray,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class _TodoListContent extends StatelessWidget {
  const _TodoListContent({
    Key key,
    @required this.todos,
  }) : super(key: key);

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      padding: const EdgeInsets.only(left: 20, right: 20),
      itemBuilder: (context, index) {
        final _todo = todos[index];
        return _TodoCard(todo: _todo);
      },
    );
  }
}

class _TodoCard extends StatelessWidget {
  const _TodoCard({
    Key key,
    @required this.todo,
  }) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          HeroDialogRoute(
            builder: (context) => Center(
              child: _TodoPopupCard(todo: todo),
            ),
          ),
        );
      },
      child: Hero(
        createRectTween: (begin, end) {
          return CustomRectTween(begin: begin, end: end);
        },
        tag: todo.id,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Material(
            color: kColorPurp,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: <Widget>[
                  _TodoTitle(title: todo.description),
                  const SizedBox(
                    height: 8,
                  ),
                  if (todo.items != null) ...[
                    const Divider(),
                    _TodoItemsBox(items: todo.items),
                  ]
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TodoTitle extends StatelessWidget {
  const _TodoTitle({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    );
  }
}

class _TodoPopupCard extends StatelessWidget {
  const _TodoPopupCard({Key key, this.todo}) : super(key: key);
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: todo.id,
      createRectTween: (begin, end) {
        return CustomRectTween(begin: begin, end: end);
      },
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Material(
          borderRadius: BorderRadius.circular(16),
          color: kColorPurp,
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _TodoTitle(title: todo.description),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            width: 200,
                            child: Text(out),
                          ),
                          Container(width: 140, child: Text(out_second))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    if (todo.items != null) ...[
                      const Divider(),
                      _TodoItemsBox(items: todo.items),
                    ],
                    Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: kColorGray,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TodoItemsBox extends StatelessWidget {
  const _TodoItemsBox({
    Key key,
    @required this.items,
  }) : super(key: key);

  final List<Item> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final item in items) _TodoItemTile(item: item),
      ],
    );
  }
}

class _TodoItemTile extends StatefulWidget {
  const _TodoItemTile({
    Key key,
    @required this.item,
  }) : super(key: key);

  final Item item;

  @override
  _TodoItemTileState createState() => _TodoItemTileState();
}

class _TodoItemTileState extends State<_TodoItemTile> {
  void _onChanged(bool val) {
    setState(() {
      widget.item.completed = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        onChanged: _onChanged,
        value: widget.item.completed,
      ),
      title: Text(widget.item.description,
          style: TextStyle(
            color: Colors.orange,
          ),
          textScaleFactor: 1.4),
    );
  }
}
