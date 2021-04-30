import 'package:coinpedia/modeller/coins.dart';
import 'package:coinpedia/yardimcisiniflar/coinbilgileri.dart';
import 'package:flutter/material.dart';

class CoinList extends StatelessWidget {
  static List<Coin> tumCoinler;

  @override
  Widget build(BuildContext context) {
    tumCoinler = coinBilgileriHazirla();

    return Scaffold(
      appBar: AppBar(
        title: Text("Coin Pedia"),
      ),
      body: listeyiHazirla(),
    );
  }

  List<Coin> coinBilgileriHazirla() {
    List<Coin> coinler = [];

    for (int i = 0; i < 11; i++) {
      String coinKresim = Strings.COIN_ADLARI[i].toLowerCase() + "${i + 1}.png";
      String coinBresim =
          Strings.COIN_ADLARI[i].toLowerCase() + "_buyuk" + "${i + 1}.png";

      Coin addCoin = Coin(Strings.COIN_ADLARI[i], Strings.COIN_FIYAT[i],
          Strings.COIN_AYRINTI[i], coinKresim, coinBresim);
      coinler.add(addCoin);
    }
    return coinler;
  }

  Widget listeyiHazirla() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return coinWidget(context, index);
      },
      itemCount: tumCoinler.length,
    );
  }

  Widget coinWidget(BuildContext context, int index) {
    Coin addEkleListe = tumCoinler[index];

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: () => Navigator.pushNamed(context, "/coinAyrinti/$index"),
          //onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>CoinAyrinti())),
          leading: Image.asset(
            "resimler/" + addEkleListe.coinKresim,
            width: 64,
            height: 64,
          ),
          title: Text(
            addEkleListe.coinAdi,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: Colors.red.shade500),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              addEkleListe.coinFiyat,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.redAccent),
            ),
          ),
          trailing: Icon(Icons.double_arrow_rounded, color: Colors.orange),
        ),
      ),
    );
  }
}
