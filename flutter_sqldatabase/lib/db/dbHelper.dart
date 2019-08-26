import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_sqldatabase/models/word.dart';

class DbHelper {
  String tblWord = "Word";

  String colid = "id";
  String colturkish = "turkish";
  String colenglish = "english";

  static final DbHelper _dbHelper = DbHelper._internal();

  DbHelper._internal();

  factory DbHelper() {
    return _dbHelper;
  }

  static Database _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await initializeDb();
    }
    return _db;
  }

  Future<Database> initializeDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "sozlul.db";
    var dbSozluk = await openDatabase(path, version: 1, onCreate: _createDB);
    return dbSozluk;
  }

  void _createDB(Database db, int version) async {
    await db.execute(
        "Create table $Word($colid integer primary key,$colturkish text , $colenglish text )");
  }

  Future<int> insert(Word word) async {
    Database db = await this.db;
    var result = await db.insert(tblWord, word.toMap());
    return result;
  }

  Future<int> update(Word word) async {
    Database db = await this.db;
    var result = await db
        .update(tblWord, word.toMap(), where: "$colid=?", whereArgs: [word.id]);
    return result;
  }

  Future<int> delete(int id) async {
    Database db = await this.db;
    var result = await db
        .rawDelete("Delete from $tblWord where $colid = $id");
    return result;
  }

Future<List> getWord() async {
    Database db = await this.db;
    var result = await db.rawQuery("Select * from $tblWord");
    return result;
  }


}
