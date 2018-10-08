import 'dart:async';
import 'dart:convert';

import 'package:hacker_news/src/models/item_model.dart';
import 'package:hacker_news/src/resources/repository.dart';
import 'package:http/http.dart' show Client, Response;

final _root = 'https://hacker-news.firebaseio.com/v0';

class ApiProvider implements Source {
  Client client = Client();

  @override
  Future<List<int>> fetchTopIds() async {
    final Response response = await client.get('$_root/topstories.json');
    final List<int> ids = List<int>.from(json.decode(response.body));
    return ids;
  }

  @override
  Future<ItemModel> fetchItem(int id) async {
    final Response response = await client.get('$_root/item/$id.json');
    final parseJson = json.decode(response.body);
    return ItemModel.fromJson(parseJson);
  }
}
