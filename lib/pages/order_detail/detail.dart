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
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  TopPart(),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: size.width,
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
                    child: DataTable(
                      columnSpacing: 15,
                      dataRowHeight: 60,
                      dividerThickness: 0.5,
                      columns: [
                        DataColumn(label: Text('Sayla')),
                        DataColumn(label: Text('Surat, ady')),
                        DataColumn(label: Text('Mocberi')),
                        DataColumn(label: Text('Bahasy')),
                      ],
                      rows: data.map((d) {
                        return DataRow(
                          color: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            if (d['checked'])
                              return Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.08);
                            return null; // Use the default value.
                          }),
                          cells: [
                            DataCell(
                              Checkbox(
                                onChanged: (value) {
                                  value = !value;
                                },
                                value: d['checked'],
                              ),
                            ),
                            DataCell(
                              Text(
                                d["ady"],
                                style: TextStyle(),
                              ),
                            ),
                            DataCell(
                              Row(
                                children: [
                                  Text(
                                    "x${d["mocberi"]}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(" ${d["unit"]}"),
                                ],
                              ),
                            ),
                            DataCell(
                              Text(
                                "${d["bahasy"]} TMT",
                                style: TextStyle(
                                  color: Color(0xff00987e),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                      // [
                      // DataRow(
                      //   cells:

                      //   // [
                      //   //   DataCell(
                      //   //     Checkbox(
                      //   //       value: true,
                      //   //       onChanged: (value) {},
                      //   //     ),
                      //   //   ),
                      //   //   DataCell(Text('Surat ady')),
                      //   //   DataCell(Text('Surat ady')),
                      //   //   DataCell(Text('Surat ady')),
                      //   // ],
                      // ),
                      // ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: size.height * 0.08,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyCustomButton(
              text: 'Kabul etme',
              color: Color(0xffff5d5d),
              splashColor: Color(0xffff6600),
            ),
            MyCustomButton(
              text: 'Kabul et',
              color: Color(0xff00c9a7),
              splashColor: Color(0xff008a24),
              onTap: _acceptFunction,
            ),
          ],
        ),
      ),
    );
  }

  _acceptFunction(BuildContext ctx) {
    return showDialog(
        context: ctx,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Stack(
              children: <Widget>[
                Container(
                  child: Center(
                    child: Text('Nailwo'),
                  ),
                ), // top part
              ],
            ),
          );
        });
  }
}

class MyCustomButton extends StatelessWidget {
  const MyCustomButton({
    Key key,
    this.text,
    this.color,
    this.splashColor,
    this.onTap,
  }) : super(key: key);
  final String text;
  final Color color;
  final Color splashColor;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          splashColor: splashColor,
          onTap: () {},
          child: Ink(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
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
          height: size.height * 0.2,
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

List<Map> data = [
  {
    'checked': false,
    'ady': 'Jacobs 150gr',
    'mocberi': 2,
    "unit": 'lt',
    'bahasy': 100,
  },
  {
    'checked': true,
    'ady': 'Jacobs 150gr',
    'mocberi': 4,
    "unit": 'kg',
    'bahasy': 100,
  },
  {
    'checked': false,
    'ady': 'Jacobs 150gr',
    'mocberi': 7,
    "unit": 'cm',
    'bahasy': 100,
  },
  {
    'checked': false,
    'ady': 'Jacobs 150gr',
    'mocberi': 10,
    "unit": 'sany',
    'bahasy': 100,
  },
  {
    'checked': true,
    'ady': 'Jacobs 150gr',
    'mocberi': 1,
    "unit": 'lt',
    'bahasy': 100,
  },
  {
    'checked': false,
    'ady': 'Jacobs 150gr',
    'mocberi': 2,
    "unit": 'lt',
    'bahasy': 100,
  },
  {
    'checked': true,
    'ady': 'Jacobs 150gr',
    'mocberi': 4,
    "unit": 'kg',
    'bahasy': 100,
  },
  {
    'checked': false,
    'ady': 'Jacobs 150gr',
    'mocberi': 7,
    "unit": 'cm',
    'bahasy': 100,
  },
  {
    'checked': true,
    'ady': 'Jacobs 150gr',
    'mocberi': 10,
    "unit": 'sany',
    'bahasy': 100,
  },
  {
    'checked': true,
    'ady': 'Jacobs 150gr',
    'mocberi': 1,
    "unit": 'lt',
    'bahasy': 100,
  },
];
