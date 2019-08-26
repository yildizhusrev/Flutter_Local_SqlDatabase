// Text boyutu "Ctrl+MouseTopu" kullanarak ayarlanabilir.
// F5 tusu ile direkt kod uretilebilir.

class Word {
  int _id;
  String _turkish;
  String _english;

  //id çikarilmalı
  Word(
    this._turkish,
    this._english,
  );

  Word.whitId(
    this._id,
    this._turkish,
    this._english,
  );

  int get id => _id;
  String get turkish => _turkish;
  String get english => _english;

  set id(int value) {
    _id = value;
  }

  set turkish(String value) {
    _turkish = value;
  }

  set english(String value) {
    _english = value;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    //id alanına null değilse id döndür sartı eklenmeli!!!
    if( map["id"]!=null){
      map["id"] = _id;
    }       
    map["turkish"] = _turkish;
    map["english"] = _english;
    return map;
  }

  Word.fromObject(dynamic o) {
    this._id = o["id"];
    this._turkish = o["turkish"];
    this._english = o["english"];
  }
}
