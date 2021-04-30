import 'package:coinpedia/coin_list.dart';
import 'package:coinpedia/modeller/coins.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class CoinAyrinti extends StatefulWidget {
  int gelenIndex;

  CoinAyrinti(this.gelenIndex);

  @override
  CoinDetayState createState() {
    return new CoinDetayState();
  }
}

class CoinDetayState extends State<CoinAyrinti> {
  Coin secilenCoin;
  Color baskinRenk;
  PaletteGenerator paletteGenerator;

  @override
  void initState() {
    super.initState();
    secilenCoin = CoinList.tumCoinler[widget.gelenIndex];
    baskinRengiBul();
  }

  void baskinRengiBul() {
    Future<PaletteGenerator> fPaletGenerator =
        PaletteGenerator.fromImageProvider(
            AssetImage("resimler/" + secilenCoin.coinBresim));
    fPaletGenerator.then((value) {
      paletteGenerator = value;
      debugPrint(
          "secilen renk :" + paletteGenerator.dominantColor.color.toString());
      setState(() {
        baskinRenk = paletteGenerator.vibrantColor.color;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: baskinRenk != null ? baskinRenk : Colors.cyan,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("images/" + secilenCoin.coinKresim,
                  fit: BoxFit.cover),
              centerTitle: true,
              title: Text(secilenCoin.coinAdi + " Coin ve Ayrıntıları"),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.pink.shade50,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: SingleChildScrollView(
                child: Text(secilenCoin.coinAyrinti,
                    style: TextStyle(fontSize: 18, color: Colors.black)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
