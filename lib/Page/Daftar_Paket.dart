import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:convert';

class DaftarPaketPage extends StatefulWidget {
  const DaftarPaketPage({Key? key}) : super(key: key);

  @override
  State<DaftarPaketPage> createState() => _DaftarPaketPageState();
}

class _DaftarPaketPageState extends State<DaftarPaketPage> {
  List _listPaket = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/sample.json');
    final data = await json.decode(response);
    setState(() {
      _listPaket = data["items"];
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF70986C),
          title: Text('Daftar Paket')),
      body:     ListView.builder(
                itemCount: _listPaket.length,
                itemBuilder:(context, index){
                  return Card(
                    key: ValueKey(_listPaket[index][""]),
                    margin: const EdgeInsets.all(10),
                    color: Colors.white,
                    child: ListTile(
                      title: Text(_listPaket[index]["resi"]),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text(_listPaket[index]["nama"]),
                        Text(_listPaket[index]["alamat"])
                        ]
                      ),
                    ),
                  );
                },
              )
      );
  }
}

