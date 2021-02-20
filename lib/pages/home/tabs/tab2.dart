import 'package:flutter/material.dart';

import '../../../constants.dart';

class Tab2 extends StatelessWidget {
  const Tab2({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, i) {
          return Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              // borderRadius: BorderRadius.only(
              //   topLeft: Radius.circular(20),
              //   bottomLeft: Radius.circular(20),
              // ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(5, 5),
                  blurRadius: 5,
                  spreadRadius: 10,
                  color: Colors.grey[200],
                ),
              ],
              border: Border(
                left: BorderSide(
                  color: i % 2 == 1 ? orangeIcon : greenIcon,
                  width: 5,
                ),
              ),
            ),
            height: size.height * 0.1,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.blue[400],
                splashFactory: InkRipple.splashFactory,
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('#123456', style: tileText),
                          Spacer(),
                          Icon(
                            Icons.games,
                            color: Colors.black.withOpacity(0.4),
                            size: 16,
                          ),
                          Text('15'),
                          SizedBox(width: 25),
                          Text('199 TMT'),
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.black.withOpacity(0.7),
                            size: 15,
                          ),
                          Text('Parahat 7'),
                          Spacer(),
                          Icon(
                            Icons.add_circle_outline,
                            color: i % 2 == 1 ? orangeIcon : greenIcon,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
