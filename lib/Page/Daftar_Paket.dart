import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_osm_kirimin/main.dart';

class DaftarPaketPage extends StatefulWidget {
  final VoidCallback onTap;

  const DaftarPaketPage({Key? key,required this.onTap}) : super(key: key);

  @override
  State<DaftarPaketPage> createState() => _DaftarPaketPageState();
}

class _DaftarPaketPageState extends State<DaftarPaketPage> {
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
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    print('DaftarPaket.dart');
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
                      onTap: (){
                        paketLatitude = double.parse(_listPaket[index]["latitude"]);
                        paketLongitude = double.parse(_listPaket[index]["longitude"]);
                        Provider.of<PaketData>(context, listen: false).setPaketData(paketLatitude!, paketLongitude!);
                        widget.onTap();
                      },
                    ),
                  );
                },
              )
      );
  }
}

