import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class lacakPesananPage extends StatefulWidget {
  const lacakPesananPage({Key? key}) : super(key: key);

  @override
  State<lacakPesananPage> createState() => _lacakPesananPageState();
}

class _lacakPesananPageState extends State<lacakPesananPage> {
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF70986C),
        title: const Text('Lacak Pesanan'),
      ),
      body: Center(
          child: Container(
              margin: EdgeInsets.only(
                  left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Masukkan No. Resi',
                        hintStyle: TextStyle(
                            color: Colors.grey.withOpacity(0.5)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        )
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("CEK"),
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(
                            Colors.white),
                        backgroundColor: MaterialStateProperty.all(
                            Color(0xFF70986C)),
                        side: MaterialStateProperty.all(
                            BorderSide(
                                color: Color(0xFF70986C),
                                width: 2.0)
                        )
                    ),
                  ),
                  ElevatedButton.icon(
                    label: Text('SCAN BARCODE'),
                    icon: Icon(Icons.qr_code_scanner),
                    onPressed: () async {
                      var res = await Navigator.push(
                          context, MaterialPageRoute(
                        builder: (context) => const SimpleBarcodeScannerPage(),
                      ));
                      setState(() {
                        if (res is String) {
                          result = res;
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF70986C),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2)
                        )
                    ),
                  ),
                  Text(result)
                ],
              )
          )
      ),
    );
  }
}