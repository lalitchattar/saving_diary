import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    final path = join(await getDatabasesPath(), 'saving_diary.db');
    return await openDatabase(
      path,
      version: 1, // Increment version if adding new table
      onCreate: (db, version) async {
        // Settings table already exists in old version; we create anyway for new installs
        await _createSettingsTable(db);
        await _createLabelTable(db);
        await _createMerchantTable(db);
        await _createCategoryTable(db);
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        // Future upgrades can be handled here
      },
    );
  }

  Future<void> _createSettingsTable(Database db) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS settings (
        key TEXT PRIMARY KEY,
        value TEXT
      )
    ''');
  }

  Future<void> _createLabelTable(Database db) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS labels (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        color TEXT NOT NULL,         
        is_active INTEGER DEFAULT 1,
        is_deleted INTEGER DEFAULT 0,
        transaction_count INTEGER DEFAULT 0,
        created_at TEXT DEFAULT CURRENT_TIMESTAMP,
        updated_at TEXT
      )
    ''');
  }

  Future<void> _createMerchantTable(Database db) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS merchants (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        type TEXT NOT NULL, 
        icon TEXT NOT NULL,        
        is_active INTEGER DEFAULT 1,
        is_deleted INTEGER DEFAULT 0,
        transaction_count INTEGER DEFAULT 0,
        created_at TEXT DEFAULT CURRENT_TIMESTAMP,
        updated_at TEXT
      )
    ''');
  }

  Future<void> _createCategoryTable(Database db) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS categories (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      type TEXT NOT NULL,
      icon TEXT NOT NULL,         
      is_active INTEGER DEFAULT 1,
      is_deleted INTEGER DEFAULT 0,
      transaction_count INTEGER DEFAULT 0,
      created_at TEXT DEFAULT CURRENT_TIMESTAMP,
      updated_at TEXT
    )
   ''');
    
    await db.execute('''
      INSERT INTO categories (name, type, icon) VALUES
         ('Salary', 'Income', 'Salary'),
        ('Trading', 'Income', 'Trading'),
        ('Interest', 'Income', 'Interest'),
        ('Savings', 'Income', 'Savings'),
        ('Profit', 'Income', 'Profit'),
        ('Gift', 'Income', 'Gift'),
        ('Other', 'Income', 'Other'),
        ('Food & Drink', 'Expense', 'Food & Drink'),
        ('Restaurant', 'Expense', 'Restaurant'),
        ('Transport', 'Expense', 'Car'),
        ('Fuel', 'Expense', 'Fuel'),
        ('Electricity', 'Expense', 'Electricity'),
        ('Medicine', 'Expense', 'Medicine'),
        ('Education', 'Expense', 'Education'),
        ('Yoga', 'Expense', 'Yoga'),
        ('Gym', 'Expense', 'Gym'),
        ('Internet', 'Expense', 'Internet'),
        ('Miscellaneous', 'Expense', 'Miscellaneous'),
        ('Emergency', 'Expense', 'Emergency'),
        ('Other', 'Expense', 'Other'),
        ('Electricity Bill', 'Expense', 'Electricity'),
        ('Water Bill', 'Expense', 'Water'),
        ('Internet Bill', 'Expense', 'Internet'),
        ('Telephone Bill', 'Expense', 'Telephone'),
        ('Insurance', 'Expense', 'CreditCard');
    ''');
  }



  /// Optional: Close database
  Future close() async {
    final db = await database;
    db.close();
  }
}
