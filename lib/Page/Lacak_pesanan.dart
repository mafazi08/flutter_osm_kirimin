import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import 'package:flutter_osm_kirimin/main.dart';
import 'package:provider/provider.dart';

class lacakPesananPage extends StatefulWidget {
  const lacakPesananPage({Key? key}) : super(key: key);

  @override
  State<lacakPesananPage> createState() => _lacakPesananPageState();
}

class _lacakPesananPageState extends State<lacakPesananPage> {
  final TextEditingController _textController = TextEditingController();
  String inputText = '';
  String result = '';
  List _listPaket = [];
  double? paketLatitude;
  double? paketLongitude;


  Future<void> readJson() async {
    const apiUrl= 'https://my-json-server.typicode.com/mafazi08/json_kirimin/db';

    final response = await http.get(Uri.parse(apiUrl));
    final data = await json.decode(response.body);

    setState(() {
      _listPaket = data["items"];
    });
    int indexPaket = _listPaket.indexWhere((paket) => paket["resi"] == inputText);
    if (indexPaket != -1){
      print(indexPaket);
      paketLatitude = double.parse(_listPaket[indexPaket]["latitude"]);
      paketLongitude = double.parse(_listPaket[indexPaket]["longitude"]);
      Provider.of<PaketData>(context, listen: false).setPaketData(paketLatitude!, paketLongitude!);
      Navigator.pop(context);
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("No. Resi Tidak Ditemukan"),
              content: const Text("No. Resi yang Anda masukkan tidak ditemukan."),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("OK")
                )
              ],
            );
          }
      );//showdialog
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF70986C),
        title: const Text('Lacak Pesanan'),
      ),
      body: Center(
          child: Container(
              margin: const EdgeInsets.only(
                  left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _textController,
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
                    onPressed: () async {
                      inputText = _textController.text;
                      await readJson();
                    },
                    child: const Text("CEK"),
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(
                            Colors.white),
                        backgroundColor: MaterialStateProperty.all(
                            const Color(0xFF70986C)),
                        side: MaterialStateProperty.all(
                            const BorderSide(
                                color: Color(0xFF70986C),
                                width: 2.0)
                        )
                    ),
                  ),
                  ElevatedButton.icon(
                    label: const Text('SCAN BARCODE'),
                    icon: const Icon(Icons.qr_code_scanner),
                    onPressed: () async {
                      var res = await Navigator.push(
                          context, MaterialPageRoute(
                        builder: (context) => const SimpleBarcodeScannerPage(),
                      ));
                      setState(() {
                        if (res is String) {
                          inputText = res;
                        }
                      });
                      if (res != null) {
                        readJson();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF70986C),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2)
                        )
                    ),
                  ),
                ],
              )
          )
      ),
    );
  }
}