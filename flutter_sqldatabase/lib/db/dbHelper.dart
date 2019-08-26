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
      
     Future<Database>   initializeDb()  async {
        Directory directory = await getApplicationDocumentsDirectory();
        String path = directory.path+"sozlul.db";
        var dbSozluk = await openDatabase(path,version:1,onCreate: _createDB); 
        return dbSozluk;
     }

     void _createDB(Database  db, int version) async{
       await db.execute("Create table $Word($colid integer primary key,$colturkish text , $colenglish text )");

     }

    
}
