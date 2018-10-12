import 'dart:async';

import 'package:hacker_news/src/models/item_model.dart';
import 'package:hacker_news/src/resources/api_provider.dart';
import 'package:hacker_news/src/resources/db_provider.dart';

class Repository {
  List<Source> sources = <Source>[ApiProvider(), dbProvider];

  List<Cache> caches = <Cache>[dbProvider];

  Future<List<int>> fetchTopIds() {
    return sources.first.fetchTopIds();
  }

  Future<ItemModel> fetchItem(int id) async {
    ItemModel itemModel;
//    Source source;
    sources.forEach((it) async => itemModel ??= await it.fetchItem(id));
    if (itemModel != null) caches.forEach((it) async => it.addItem(itemModel));
    return itemModel;

//    var item = await dbProvider.fetchItem(id);
//    if (item != null) return item;
//    item = await apiProvider.fetchItem(id);
//    dbProvider.addItem(item);
//    return item;
  }
}

abstract class Source {
  Future<List<int>> fetchTopIds();

  Future<ItemModel> fetchItem(int id);
}

abstract class Cache {
  Future<int> addItem(ItemModel item);
}
