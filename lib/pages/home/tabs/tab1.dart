import 'package:flutter/material.dart';
import 'package:tajiryol_collector/icons.dart';
import 'package:tajiryol_collector/pages/order_detail/detail.dart';

String randtext = "#1636713616367138163671";
String address = "Ashgabat, Parahat 7, jay 20, 4 oy";

class Tab1 extends StatelessWidget {
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
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  offset: Offset(5, 5),
                  blurRadius: 5,
                  spreadRadius: 10,
                  color: Colors.grey[200],
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.blue[400],
                splashFactory: InkRipple.splashFactory,
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => OrderDetailPage()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              randtext,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                              maxLines: 1,
                            ),
                            SizedBox(height: 8),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgIcons.location,
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    address,
                                    style: TextStyle(fontSize: 15),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              SvgIcons.cube,
                              SizedBox(width: 5),
                              Text(
                                '15',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 9),
                          Row(
                            children: [
                              SvgIcons.pricetags,
                              SizedBox(width: 8),
                              Text.rich(
                                TextSpan(text: '199', children: [
                                  TextSpan(
                                    text: " TMT",
                                    style: TextStyle(
                                      color: Color(0xff008A24),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                ]),
                                style: TextStyle(
                                  color: Color(0xff008A24),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 19,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
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
