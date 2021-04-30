import 'package:flutter/material.dart';

class VeriEkleme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hesap Makinesi",
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hesaplama Aracı'),
      ),
      body: HesapAraci(),
    );
  }
}

class HesapAraci extends StatefulWidget {
  @override
  _HesapAraciState createState() => _HesapAraciState();
}

class _HesapAraciState extends State<HesapAraci> {
  num sayi1, sayi2, sonuc;
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  sayiTopla() {
    setState(() {
      sayi1 = num.parse(t1.text);
      sayi2 = num.parse(t2.text);
      sonuc = sayi1 + sayi2;
    });
  }

  sayiCikar() {
    setState(() {
      sayi1 = num.parse(t1.text);
      sayi2 = num.parse(t2.text);
      sonuc = sayi1 - sayi2;
    });
  }

  sayiCarp() {
    setState(() {
      sayi1 = num.parse(t1.text);
      sayi2 = num.parse(t2.text);
      sonuc = sayi1 * sayi2;
    });
  }

  sayiBol() {
    setState(() {
      sayi1 = num.parse(t1.text);
      sayi2 = num.parse(t2.text);
      sonuc = sayi1 / sayi2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(
        50,
      ),
      child: Center(
          child: Column(
        children: <Widget>[
          Text("$sonuc"),
          TextField(
            controller: t1,
          ),
          TextField(
            controller: t2,
          ),
          RaisedButton(
            onPressed: sayiTopla,
            child: Text("Topla"),
          ),
          RaisedButton(
            onPressed: sayiCikar,
            child: Text("Çıkar"),
          ),
          RaisedButton(
            onPressed: sayiCarp,
            child: Text("Çarp"),
          ),
          RaisedButton(
            onPressed: sayiBol,
            child: Text("Böl"),
          ),
        ],
      )),
    );
  }
}
