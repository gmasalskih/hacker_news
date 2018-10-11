import 'dart:async';

import 'package:hacker_news/src/models/item_model.dart';
import 'package:hacker_news/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class StoriesBloc {
  final _repository = Repository();
  final _topIds = PublishSubject<List<int>>();
  final _items = BehaviorSubject<int>();
  Observable<Map<int, Future<ItemModel>>> items;

  Observable<List<int>> get topIds => _topIds.stream;
  Function(int) get fetchItem => _items.sink.add;

  StoriesBloc() {
    items = _items.stream.transform(_itemTransformer());
  }

  _itemTransformer() {
    return ScanStreamTransformer(
        (Map<int, Future<ItemModel>> cache, int id, int index) {
      cache[id] = _repository.fetchItem(id);
      return cache;
    }, <int, Future<ItemModel>>{});
  }

  fetchTopIds() async {
    final List<int> ids = await _repository.fetchTopIds();
    _topIds.sink.add(ids);
  }

  dispose() {
    _topIds.close();
    _items.close();
  }
}
