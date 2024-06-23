import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'cart.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE cart(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        productId INTEGER,
        productName TEXT,
        price TEXT,
        quantity INTEGER
      )
    ''');
  }

  Future<int> insertCartItem(Map<String, dynamic> item) async {
    final db = await database;
    return await db.insert('cart', item);
  }

  Future<List<Map<String, dynamic>>> getCartItems() async {
    final db = await database;
    return await db.query('cart');
  }

  Future<int> updateCartItem(Map<String, dynamic> item) async {
    final db = await database;
    return await db.update(
      'cart',
      item,
      where: 'id = ?',
      whereArgs: [item['id']],
    );
  }

  Future<int> deleteCartItem(int id) async {
    final db = await database;
    return await db.delete(
      'cart',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
