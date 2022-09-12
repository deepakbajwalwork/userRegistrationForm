import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class DBProvider {
  // Create a singleton
  DBProvider._();

  static DBProvider instance = DBProvider._();
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDB();
    return _database!;
  }

  _onOpen(Database db) async {
    // Database is open, print its version
    // print('db version ${await db.getVersion()}');
  }

  /// Create USer table V2
  // void _createTableUserV2(Batch batch) {
  void _createTableUserV2(Database db, int version) {
    db.execute('DROP TABLE IF EXISTS Users');
    db.execute(
      '''CREATE TABLE IF NOT EXISTS Users(
                    id int(100) PRIMARY KEY,
                    first_name varchar(200),
                    last_name varchar(200),
                    phone_number varchar(200),
                    gender varchar(200),
                    email varchar(200),
                    password varchar(200),
                    address varchar(200),
                    city varchar(200),
                    landmark varchar(200),
                    pincode varchar(200),
                    picture BLOB,
                    grade varchar(200),
                    yearOfPassing varchar(200),
                    designation varchar(200),
                    domain varchar(200),
                    education varchar(200),
                    experience varchar(200),
                    state varchar(200),
                    updated_at TEXT DEFAULT '')''',
    );
  }

  initDB() async {
    Directory documentsDir = await getApplicationDocumentsDirectory();
    String path = join(documentsDir.path, 'usrRegForm.db');

    try {
      return await openDatabase(path,
          version: 1,
          onOpen: _onOpen,
          onCreate: _createTableUserV2,
          onDowngrade: onDatabaseDowngradeDelete);
    } catch (e) {
      print(e.toString());
    }
  }
}
