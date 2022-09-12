// import 'package:fetchtask/pages/Models/model.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:sqflite/sqlite_api.dart';
// import 'dart:async';
// import 'databaseHelper.dart';

import 'dart:convert';

import 'package:registerform/model/user_model.dart';
import 'package:sqflite/sqflite.dart';

import 'database_helper.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper.internal();
  factory DatabaseHelper() => instance;
  static Database? db;

  DatabaseHelper.internal();

  static const String _userTableName = "Users";

  initDb() async {
    DBProvider? dbProvider = DBProvider.instance;
    db = await dbProvider.database;
  }

  Future<int> saveUser(
    UsersModel datas,
  ) async {
    try {
      int res = await db!.insert(_userTableName, datas.toJson());
      return res;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<UsersModel>> getUser() async {
    try {
      var rows = await db!.query(_userTableName);

      return rows.isNotEmpty
          ? rows
              .map(
                (classes) => UsersModel.fromJson(classes),
              )
              .toList()
          : [];
    } catch (e) {
      print(e.toString());
      throw e;

      // throw e.toString();
    }
  }
}
