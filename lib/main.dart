import 'package:coinpedia/buttomdansayfalar/coinpediasiralama.dart';
import 'package:coinpedia/buttomdansayfalar/eklemesayfasi.dart';
import 'package:coinpedia/buttomdansayfalar/hakkinda.dart';
import 'package:coinpedia/buttomdansayfalar/homepage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "CoinPedia",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int secilenMenuItem = 0;
  List<Widget> tumSayfalar;
  HomePage sayfaAna;
  Siralama sayfaSiralama;
  VeriEkleme sayfaEkleme;
  Hakkinda sayfaHakkinda;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sayfaAna = HomePage();
    sayfaSiralama = Siralama();
    sayfaEkleme = VeriEkleme();
    sayfaHakkinda = Hakkinda();
    tumSayfalar = [
      sayfaAna,
      sayfaSiralama,
      sayfaEkleme,
      sayfaHakkinda,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("COIN PEDIA"),
        centerTitle: true,
      ),
      body: tumSayfalar[secilenMenuItem],
      bottomNavigationBar: bottomNavMenu(),
    );
  }

  Theme bottomNavMenu() {
    return Theme(
      data: ThemeData(),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Ana Sayfa",
            backgroundColor: Colors.cyan,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.addchart),
              label: "Bilgiler",
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
              label: "Hesaplama",
              backgroundColor: Colors.lightBlue),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            backgroundColor: Colors.blueAccent,
            label: "Hakkında",
          ),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: secilenMenuItem,
        onTap: (index) {
          setState(() {
            secilenMenuItem = index;
          });
        },
      ),
    );
  }
}
