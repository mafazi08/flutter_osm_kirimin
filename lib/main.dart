import 'package:flutter/material.dart';
import 'package:flutter_osm_kirimin/Page/Bantuan.dart';
import 'package:flutter_osm_kirimin/Page/Beranda.dart';
import 'package:flutter_osm_kirimin/Page/Lacak_Paket.dart';
import 'package:flutter_osm_kirimin/Page/Saya.dart';

void main() {
  runApp(const MyApp());
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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _currentIndex = 0;

  final tabs = [
    BerandaPage(),
    LacakPaketPage(),
    BantuanPage(),
    SayaPage(),
  ];

  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        backgroundColor: Color(0xFF70986C),
        title: ElevatedButton.icon(
          icon: Icon(Icons.search),
          label: Text("Lacak Pesanan"),
          onPressed: (){},
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF717070),
            foregroundColor: Colors.white,
            shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32)
            )
          )
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: tabs[_currentIndex],
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "Beranda"),
        BottomNavigationBarItem(icon: Icon(Icons.backpack),label:"Lacak Paket"),
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