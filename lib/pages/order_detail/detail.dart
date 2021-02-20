import 'package:flutter/material.dart';

import '../../constants.dart';

class OrderDetailPage extends StatefulWidget {
  @override
  _OrderDetailPageState createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffeeeeee),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Harytlaryň sanawy",
          style: appTitle,
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                TopPart(),
                Padding(
                  padding: const EdgeInsets.only(top: 13),
                  child: Ink(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(5, 5),
                          blurRadius: 5,
                          spreadRadius: 10,
                          color: Colors.grey[200],
                        ),
                      ],
                    ),
                    child: Text('asdasd'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: size.height * 0.08,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: Color(0xff00C9A7),
        child: Center(
            child: Text(
          'Eltip berildi',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        )),
      ),
    );
  }
}

class TopPart extends StatelessWidget {
  const TopPart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.blue[400],
        splashFactory: InkRipple.splashFactory,
        onTap: () {},
        child: Ink(
          height: size.height * 0.25,
          padding: EdgeInsets.all(18),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  offset: Offset(5, 5),
                  blurRadius: 5,
                  spreadRadius: 10,
                  color: Colors.grey[200],
                ),
              ]),
          child: Column(
            children: [
              OrderDetailUserItem(
                icon: Icons.receipt_outlined,
                text1: "Çek nomeri:",
                text2: "#123456",
              ),
              OrderDetailUserItem(
                icon: Icons.phone_android_outlined,
                text1: "Telefon:",
                text2: "+993 61 465666",
              ),
              OrderDetailUserItem(
                icon: Icons.location_on_outlined,
                text1: "Salgysy:",
                text2: "Parahat 7, Abadan koce, jay 4, Ashgabat, Turkmenistan",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderDetailUserItem extends StatelessWidget {
  const OrderDetailUserItem({
    Key key,
    @required this.icon,
    @required this.text1,
    @required this.text2,
  }) : super(key: key);

  final IconData icon;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            width: size.width * 0.3,
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 15,
                ),
                SizedBox(width: 5),
                Text(
                  text1,
                  style: orderDetailText1,
                ),
              ],
            ),
          ),
          Container(
              width: size.width * 0.46,
              child: Text(
                text2,
                style: orderDetailText2,
              )),
        ],
      ),
    );
  }
}
