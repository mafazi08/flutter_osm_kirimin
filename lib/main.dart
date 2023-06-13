import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_osm_kirimin/Page/Bantuan.dart';
import 'package:flutter_osm_kirimin/Page/Beranda.dart';
import 'package:flutter_osm_kirimin/Page/Daftar_Paket.dart';
import 'package:flutter_osm_kirimin/Page/Saya.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PaketData(),
      child: MyApp(),
    ),
  );
}

class PaketData extends ChangeNotifier {
  double? paketLatitude;
  double? paketLongitude;

  void setPaketData(double latitude, double longitude) {
    paketLatitude = latitude;
    paketLongitude = longitude;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kirim.in',
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color(0xFFE6DDDD),
          selectedItemColor: Color(0xFF70986C),
          unselectedItemColor: Color(0xFF717070),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _currentIndex = 0;

  void _onIndexChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  late final tabs = [
    BerandaPage(),
    DaftarPaketPage(onTap: () {
      _onIndexChanged(0);
    }),
    BantuanPage(),
    SayaPage(),
  ];

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "Beranda"),
        BottomNavigationBarItem(icon: Icon(Icons.backpack),label:"Daftar Paket"),
        BottomNavigationBarItem(icon: Icon(Icons.question_mark),label:"Bantuan"),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: "Saya")
      ],
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    ),
    );
    }
  }