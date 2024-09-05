import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  static Database? _database;

  DBHelper._internal();

  factory DBHelper() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'farm.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE stock(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        item TEXT NOT NULL,
        quantity INTEGER NOT NULL
      )
    ''');

    // Inserir alguns dados iniciais
    await db.insert('stock', {'item': 'Alface', 'quantity': 100});
    await db.insert('stock', {'item': 'Tomate', 'quantity': 50});
    await db.insert('stock', {'item': 'Batata', 'quantity': 200});
  }

  Future<Map<String, dynamic>?> buscarItem(String nomeItem) async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db.query(
      'stock',
      where: 'item = ?',
      whereArgs: [nomeItem],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }
}
