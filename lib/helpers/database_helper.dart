import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/product.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'products.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE products(
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        description TEXT NOT NULL,
        price INTEGER NOT NULL,
        assetImage TEXT NOT NULL
      )
    ''');

    // Insert dummy data
    await _insertDummyData(db);
  }

  Future<void> _insertDummyData(Database db) async {
    final dummyProducts = [
      {
        'id': 'p1',
        'name': 'Blangkon Asli',
        'description':
            'Blangkon khas Desa Pakis, dibuat tangan oleh pengrajin lokal.',
        'price': 120000,
        'assetImage': 'assets/images/blangkon.png',
      },
      {
        'id': 'p2',
        'name': 'Souvenir Batik',
        'description':
            'Souvenir batik motif tradisional, cocok untuk cinderamata.',
        'price': 75000,
        'assetImage': 'assets/images/batik.png',
      },
      {
        'id': 'p3',
        'name': 'Peci Bordir',
        'description': 'Peci bordir khas untuk acara adat dan resmi.',
        'price': 45000,
        'assetImage': 'assets/images/peci.png',
      },
      {
        'id': 'p4',
        'name': 'Tas Anyaman Pandan',
        'description':
            'Tas anyaman dari daun pandan alami, ringan dan ramah lingkungan.',
        'price': 95000,
        'assetImage': 'assets/images/tas_pandan.png',
      },
      {
        'id': 'p5',
        'name': 'Gantungan Kunci Kayu',
        'description':
            'Gantungan kunci ukiran kayu jati dengan motif khas Jawa Tengah.',
        'price': 25000,
        'assetImage': 'assets/images/gantungan_kunci.png',
      },
      {
        'id': 'p6',
        'name': 'Topi Anyaman Bambu',
        'description':
            'Topi tradisional anyaman bambu, nyaman dipakai di luar ruangan.',
        'price': 60000,
        'assetImage': 'assets/images/topi_bambu.png',
      },
    ];

    for (var product in dummyProducts) {
      await db.insert('products', product,
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  // CRUD Operations
  Future<List<Product>> getAllProducts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('products');
    return List.generate(maps.length, (i) {
      return Product.fromMap(maps[i]);
    });
  }

  Future<Product?> getProductById(String id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'products',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Product.fromMap(maps.first);
    }
    return null;
  }

  Future<int> insertProduct(Product product) async {
    final db = await database;
    return await db.insert('products', product.toMap());
  }

  Future<int> updateProduct(Product product) async {
    final db = await database;
    return await db.update(
      'products',
      product.toMap(),
      where: 'id = ?',
      whereArgs: [product.id],
    );
  }

  Future<int> deleteProduct(String id) async {
    final db = await database;
    return await db.delete(
      'products',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteDatabaseFile() async {
    String path = join(await getDatabasesPath(), 'products.db');
    await deleteDatabase(path);
  }
}
