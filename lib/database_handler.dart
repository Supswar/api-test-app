import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHandler {
  static Database? _database;

  Future<Database?> openDB() async{
    _database = await openDatabase(
      join(await getDatabasesPath(),'demo.db')
    );
  }
}