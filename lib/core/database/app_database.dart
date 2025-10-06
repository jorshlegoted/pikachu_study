import 'package:path/path.dart';
import 'package:pikachi_dobre/core/utils/constants/app_strings.dart';
import 'package:sqflite/sqflite.dart';

const idType = 'INTEGER PRIMARY KEY';
const integerType = 'INTEGER NOT NULL';
const textType = 'TEXT NOT NULL';

const fileName = 'app_database.db';

class AppDatabase {
  AppDatabase._();

  static final instance = AppDatabase._();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB(AppStrings.appDatabase);
    return _database!;
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
CREATE TABLE ${AppStrings.pokemonDatabaseName} {
id $idType,
name $textType,
base_experience $integerType,
height $integerType,
weight $integerType,
abilities $textType,
sprites $textType,
types $textType
}
 ''');
  }

  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }
}
