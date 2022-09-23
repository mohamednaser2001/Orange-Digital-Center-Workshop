

import 'package:sqflite/sqflite.dart';

class SqlDatabase{
  static Database ?db;

  initialDb()async {
    String databasePath=await getDatabasesPath();
  //  String path=join(databasePath,'notes');
  }
}