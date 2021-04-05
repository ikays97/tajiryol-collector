import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tajiryol_collector/icons.dart';
import 'tab1.dart';

class Tab2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (context, i) {
        return Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 16),
          padding: const EdgeInsets.all(16.0),
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
          child: InkWell(
            splashColor: Colors.blue[400],
            splashFactory: InkRipple.splashFactory,
            onTap: () {},
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.40,
                            child: Text(
                              randtext,
                              style: TextStyle(
                                color: Color(0xff00987E),
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                              maxLines: 1,
                            ),
                          ),
                          Spacer(),
                          SvgIcons.cube,
                          SizedBox(width: 5),
                          Text(
                            '15',
                            style: TextStyle(
                              color: Color(0xff00987E),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(width: 15),
                          // TODO: round price 0.99 TMT
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/pricetags.svg',
                                height: 15,
                                width: 15,
                                color: Colors.black54,
                              ),
                              SizedBox(width: 8),
                            ],
                          ),
                          Text(
                            '199 TMT',
                            style: TextStyle(
                              color: Color(0xff00987E),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgIcons.location,
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              address,
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xff00987E),
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                          ),
                          SvgIcons.checked,
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
