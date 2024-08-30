import 'dart:convert';

import 'package:path/path.dart';
import 'package:quotes_app_database/modal/quotes_db_modal.dart';
import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class QuotesDbHelper {
  Future<Map<String,dynamic>?> apiFetchData() async {
    Uri url = Uri.parse("https://api-get-quotes.vercel.app/api/v1/quotes");
    Response response = await http.get(url);
    if (response.statusCode == 200) {
      final json = response.body;
      Map<String,dynamic> data = jsonDecode(json);

      return data;
    } else {
      return {};
    }
  }

  static QuotesDbHelper dbHelper = QuotesDbHelper._();

  QuotesDbHelper._();

  Database? _db;

  Future<Database?> get database async => _db ?? await initDatabase();

  Future<Database?> initDatabase() async {
    final path = await getDatabasesPath();
    final dbPath = join(path, 'quotesDataAll.db');

    _db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        String sql = '''
        CREATE TABLE quotesDataAll(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        category TEXT,
        quote TEXT,
        author TEXT,
        description TEXT
        
        );
        ''';
        await db.execute(sql);
      },
    );
    return _db!;
  }

  Future<void> insertData(
      String category, String quote, String author, String description) async {
    Database? db = await database;

    String sql = '''
    INSERT INTO quotesDataAll
    
    (category,quote,author,description) VALUES (?,?,?,?);
     ''';

    List args = [category, quote, author, description];
    await db!.database.rawInsert(sql,args);
  }


  Future<List<Map<String, Object?>>> readData()
  async {
    Database? db=await  database;
    String sql='''
    
    SELECT * FROM quotesDataAll
    
    ''';
    return await db!.rawQuery(sql);
  }
}
