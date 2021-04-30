class Coin {
  String _coinAdi;
  String _coinFiyat;
  String _coinAyrinti;
  String _coinKresim;
  String _coinBresim;

  Coin(this._coinAdi, this._coinFiyat, this._coinAyrinti, this._coinKresim,
      this._coinBresim);

  String get coinBresim => _coinBresim;

  set coinBresim(String value) {
    _coinBresim = value;
  }

  String get coinKresim => _coinKresim;

  set coinKresim(String value) {
    _coinKresim = value;
  }

  String get coinAyrinti => _coinAyrinti;

  set coinAyrinti(String value) {
    _coinAyrinti = value;
  }

  String get coinFiyat => _coinFiyat;

  set coinFiyat(String value) {
    _coinFiyat = value;
  }

  String get coinAdi => _coinAdi;

  set coinAdi(String value) {
    _coinAdi = value;
  }
}
