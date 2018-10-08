import 'dart:async';
import 'dart:io';

import 'package:hacker_news/src/models/item_model.dart';
import 'package:hacker_news/src/resources/repository.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

const String _CREATE_TABLE_QUERY = """CREATE TABLE Items(
        id INTEGER PRIMARY KEY,
        deleted INTEGER,
        type TEXT,
        by TEXT,
        time INTEGER,
        text TEXT,
        dead INTEGER,
        parent INTEGER,
        kids BLOB,
        url TEXT,
        score INTEGER,
        title TEXT,
        descendants INTEGER)""";

class _DbProvider implements Source, Cache {
  Database db;

  _DbProvider() {
    init();
  }

  void init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'items.db');
    db = await openDatabase(path, version: 1, onCreate: onCreateDB);
  }

  onCreateDB(Database newDB, int version) => newDB.execute(_CREATE_TABLE_QUERY);

  @override
  Future<ItemModel> fetchItem(int id) async {
    final List<Map<String, dynamic>> maps = await db.query(
      'Items',
      columns: null,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.length > 0) return ItemModel.fromDb(maps.first);
    return null;
  }

  @override
  Future<int> addItem(ItemModel item) {
    return db.insert("Items", item.toMapForDb());
  }

  @override
  Future<List<int>> fetchTopIds() {
    return null;
  }
}

final _DbProvider dbProvider = _DbProvider();
