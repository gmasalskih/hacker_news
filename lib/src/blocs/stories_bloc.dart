import 'package:hacker_news/src/models/item_model.dart';
import 'package:hacker_news/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class StoriesBloc{
  final _repository = Repository();
  final _topIds = PublishSubject<List<int>>();

  Observable<List<int>> get topIds => _topIds.stream;

  fetchTopIds() async {
    final List<int> ids = await _repository.fetchTopIds();
    _topIds.sink.add(ids);
  }

  dispose(){
    _topIds.close();
  }
}