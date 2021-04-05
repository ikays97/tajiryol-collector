import 'package:flutter/material.dart';
import 'package:tajiryol_collector/pages/order_detail/detail.dart';

class DeliveryPage extends StatefulWidget {
  @override
  _DeliveryPageState createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Boş dostawşik"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(18),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(14),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OrderDetailUserItem(
                      icon: Icons.receipt_outlined,
                      text1: "Dostawshik",
                      text2: "Mekan  N3",
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Takmynan: 15 minutdan boşaýa",
                        style: TextStyle(
                          color: Colors.redAccent,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onSubmitTap,
                  child: Text(
                    "Tabşyr",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onSubmitTap() async {
    final size = MediaQuery.of(context).size;
    // TODO: make success dialog
    await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return Dialog(
            insetPadding: const EdgeInsets.all(0),
            backgroundColor: Colors.white,
            child: Container(
              width: size.width * 0.90,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset("assets/icons/checkmark.png"),
                    const SizedBox(height: 18),
                    SizedBox(
                      width: size.width - 130,
                      child: Text(
                        "Harytlar dostawşiga tabşyryldy.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff00987E),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    SizedBox(
                      width: size.width * 0.3,
                      child: ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(
                          "Yza",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
