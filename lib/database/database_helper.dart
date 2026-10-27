import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;

  static Future<Database> get database async {
    if(_database != null){
      return _database!;
    }

    String path = join(
      await getDatabasesPath(),
      'shopping_app.database',
    );

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE cart (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            productName TEXT NOT NULL,
            price INTEGER NOT NULL,
            image TEXT,
            quantity INTEGER NOT NULL
          )
        ''');

        await db.execute('''
          CREATE TABLE orders (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            productName TEXT NOT NULL,
            price INTEGER NOT NULL,
            image TEXT,
            quantity INTEGER NOT NULL,
            total INTEGER NOT NULL
          )
        ''');
      },
    );

    return _database!;
  }

  static Future<int> insertCartItem(
      Map<String, dynamic> item,
      ) async {
    final db = await database;

    return await db.insert(
      'cart',
      {
        'productName': item['productName'],
        'price': item['price'],
        'image': item['image'],
        'quantity': item['quantity'],
      },
    );
  }

  static Future<int> insertOrderItem(
      Map<String, dynamic> item,
      ) async {
    final db = await database;

    return await db.insert(
      'orders',
      {
        'productName': item['productName'],
        'price': item['price'],
        'image': item['image'],
        'quantity': item['quantity'],
        'total': item['price'] * item['quantity'],
      },
    );
  }

  static Future<List<Map<String,
      dynamic>>> getOrders() async {
    final db = await database;

    return await db.query(
      'orders',
      orderBy: 'id DESC',
    );
  }

  static Future<int> removeCartItem(int id) async {
    final db = await database;

    return await db.delete(
      'cart',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}