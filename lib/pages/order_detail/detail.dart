import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:tajiryol_collector/model/product.dart';
import 'package:tajiryol_collector/pages/delivery_page/delivery.dart';
import '../../extensions.dart';

class OrderDetailPage extends StatefulWidget {
  @override
  _OrderDetailPageState createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  String _barcode;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Harytlaryň sanawy"),
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Container(
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
                  child: OrderDetailUserItem(
                    icon: Icons.receipt_outlined,
                    text1: "Çek nomeri:",
                    text2: "#123456",
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () => _onScanTap(),
                    icon: Icon(Icons.qr_code_rounded),
                    label: Text(
                      'Produkt scannen',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black.withOpacity(0.06)),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 3),
                        blurRadius: 5,
                        color: Colors.grey[200],
                      ),
                    ],
                  ),
                  child: DataTable(
                    columnSpacing: 15,
                    dataRowHeight: 60,
                    dividerThickness: 0.5,
                    showCheckboxColumn: false,
                    columns: [
                      DataColumn(label: Text('Kody')),
                      DataColumn(label: Text('Ady')),
                      DataColumn(label: Text('Mocberi')),
                      DataColumn(label: Text('Status')),
                    ],
                    rows: data.map((product) {
                      return buildTableItem(product);
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: size.height * 0.08,
        // color: Colors.white,
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 8),
            Expanded(
              child: ElevatedButton(
                  onPressed: _onSubmitTap,
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 150),
                    child:
                        // Theme(
                        //   data:
                        //       Theme.of(context).copyWith(accentColor: Colors.white),
                        //   child: ProgressIndicatorSmall(),
                        // ),
                        Text(
                      'Toplandy',
                      style: TextStyle(fontSize: 16),
                    ),
                  )),
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }

  DataRow buildTableItem(Product product) {
    return DataRow(
      color:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (product.checked) return Color(0xffff7b00).withOpacity(0.07);
        return null; // Use the default value.
      }),
      cells: [
        DataCell(
          SizedBox(
            width: 30,
            height: 30,
            child: BarcodeWidget(
              barcode: Barcode.code128(),
              data: product.barcode,
              drawText: false,
            ),
          ),
        ),
        DataCell(
          SizedBox(
            width: 120,
            child: Text(
              product.name,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        DataCell(
          Row(
            children: [
              Text(
                "x${product.count}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(product.unit),
            ],
          ),
        ),
        DataCell(AnimatedContainer(
          duration: Duration(milliseconds: 100),
          child: Text(
            product.checked ? "Toplandy" : "Toplanmady",
            style: TextStyle(
              fontSize: 11,
              fontWeight: product.checked ? FontWeight.bold : FontWeight.w400,
              color: product.checked ? Colors.green : Colors.red,
            ),
          ),
        )),
      ],
    );
  }

  void _onSubmitTap() async {
    final scanned = data.where((e) => e.checked == true);
    await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 0,
            backgroundColor: Colors.white,
            content: Container(
              // TODO: remove this later
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Tassykla',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Text("Toplanan haryt:", style: TextStyle(fontSize: 18)),
                      Spacer(),
                      Text("${scanned.length}",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text("Jemi haryt:", style: TextStyle(fontSize: 18)),
                      Spacer(),
                      Text("${data.length}",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  'Yok',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => DeliveryPage()));
                },
                child: Text(
                  'Hawa',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          );
        });
  }

  Future<void> _onScanTap() async {
    String barcode;
    try {
      barcode = await FlutterBarcodeScanner.scanBarcode(
          "#ff7b00", "Yza", true, ScanMode.BARCODE);
      print("$barcode barcode result");
    } on PlatformException {
      showSnackbar(context, "Failed to get platform version");
    }

    if (!mounted) return;

    setState(() {
      data.forEach((product) {
        if (product.barcode == barcode) {
          if (product.getChecked) showSnackbar(context, "Haryt uje topladynyz");
          product.setChecked = true;
        }
      });
    });
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
                ),
              ],
            ),
          ),
          Container(
              width: size.width * 0.46,
              child: Text(
                text2,
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}

List<Product> data = [
  Product(
    id: "1",
    name: "Jacobs",
    count: 2,
    unit: "lt",
    barcode: "Jacobs",
  ),
  Product(
    id: "1",
    name: "Nescafe",
    count: 2,
    unit: "kg",
    barcode: "4006067061288",
  ),
  Product(
    id: "1",
    name: "Gosa Cynar",
    count: 2,
    unit: "cm",
    barcode: "Gosa Cynar",
  ),
  Product(
    id: "1",
    name: "HES Premium",
    count: 2,
    unit: "gr",
    barcode: "4833004770862",
  ),
  Product(
    id: "1",
    name: "Koke Pay",
    count: 2,
    unit: "sany",
    barcode: "Koke Pay",
  ),
  Product(
    id: "1",
    name: "Snickers",
    count: 2,
    unit: "sany",
    barcode: "Koke Pay",
  ),
  Product(
    id: "1",
    name: "Coca Cola",
    count: 2,
    unit: "sany",
    barcode: "Koke Pay",
  ),
  Product(
    id: "1",
    name: "Jorap",
    count: 2,
    unit: "sany",
    barcode: "Koke Pay",
  ),
];
