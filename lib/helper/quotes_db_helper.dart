// import 'dart:convert';
//
// import 'package:path/path.dart';
// import 'package:quotes_app_database/modal/quotes_db_modal.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:http/http.dart';
// import 'package:http/http.dart' as http;
//
// class QuotesDbHelper {
//   Future<Map<String,dynamic>?> apiFetchData() async {
//     Uri url = Uri.parse("https://sheetdb.io/api/v1/accmtecgjck1x");
//     Response response = await http.get(url);
//     if (response.statusCode == 200) {
//       final json = response.body;
//       Map<String,dynamic> data = jsonDecode(json);
//       List<Quotes> quotes = data.map((m1)=>Quotes.fromMap(m1));
//
//       if (category != null) {
//         quotes = quotes.where((quote) => quote.category == category).toList();
//       }
//
//       return quotes;
// print(data);
//       return data;
//     } else {
//       return {};
//     }
//   }
//
//   static QuotesDbHelper dbHelper = QuotesDbHelper._();
//
//   QuotesDbHelper._();
//
//   Database? _db;
//
//   Future<Database?> get database async => _db ?? await initDatabase();
//
//   Future<Database?> initDatabase() async {
//     final path = await getDatabasesPath();
//     final dbPath = join(path, 'quotesDataAll.db');
//
//     _db = await openDatabase(
//       dbPath,
//       version: 1,
//       onCreate: (db, version) async {
//         String sql = '''
//         CREATE TABLE quotesDataAll(
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         category TEXT,
//         quote TEXT,
//         author TEXT,
//         description TEXT
//
//         );
//         ''';
//         await db.execute(sql);
//       },
//     );
//     return _db!;
//   }
//
//   Future<void> insertData(
//       String quote, String author, String cate, String liked) async {
//     Database? db = await database;
//
//     String sql = '''
//     INSERT INTO quotesDataAll
//
//     (quote,author,cate,liked) VALUES (?,?,?,?);
//      ''';
//
//     List args = [quote,author,cate,liked];
//     await db!.database.rawInsert(sql,args);
//   }
//
//
//   Future<List<Map<String, Object?>>> readData()
//   async {
//     Database? db=await  database;
//     String sql='''
//
//     SELECT * FROM quotesDataAll
//
//     ''';
//     return await db!.rawQuery(sql);
//   }
// }
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('quotes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
       CREATE TABLE quotes (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      text TEXT NOT NULL,
      author TEXT NOT NULL,
      cate TEXT NOT NULL,
      liked TEXT NOT NULL
    )
    ''');
  }

  Future<void> insertQuote(Database db, String cate, String text, String author, String liked) async {
    await db.rawInsert('''
    INSERT INTO quotes (cate, id, text, author, liked) VALUES (?, NULL, ?, ?, ?)
  ''', [cate, text, author, liked]);
  }

  Future<int> deleteQuote(String text) async {
    final db = await instance.database;
    return await db.delete('quotes', where: 'text = ?', whereArgs: [text]);
  }

  Future<List<Map<String, dynamic>>> getLikedQuotes() async {
    final db = await instance.database;
    return await db.query('quotes', where: 'liked = ?', whereArgs: [1]);
  }

  Future<List<Map<String, dynamic>>> getLikedcateQuotes(String cate) async {
    final db = await instance.database;
    return await db.query(
      'quotes',
      where: 'liked = ? AND category = ?',
      whereArgs: [1, cate],
    );
  }

}
