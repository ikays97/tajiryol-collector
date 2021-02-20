import 'package:flutter/material.dart';

class MyScrollTest extends StatefulWidget {
  MyScrollTest({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyScrollTestState createState() => _MyScrollTestState();
}

class _MyScrollTestState extends State<MyScrollTest> {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    for (int i = 0; i < 100; i++) list.add(buildContainer());
    return Scaffold(body: ListView(children: list));
  }

  Widget buildContainer() {
    ScrollController _scrollController = ScrollController();

    return NotificationListener<ScrollNotification>(
      onNotification: (scrollState) {
        if (scrollState is ScrollEndNotification &&
            scrollState.metrics.pixels != 160) {
          Future.delayed(const Duration(milliseconds: 100), () {}).then((s) {
            _scrollController.animateTo(160,
                duration: Duration(milliseconds: 500), curve: Curves.ease);
          });
        }
        return false;
      },
      child: Container(
        height: 160,
        margin: EdgeInsets.only(bottom: 1),
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          controller: _scrollController,
          children: <Widget>[
            Container(
              width: 360,
              height: 20,
              color: Colors.red,
            ),
            Container(
              width: 160,
              height: 20,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
