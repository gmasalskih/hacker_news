import 'dart:convert';

import 'package:hacker_news/src/models/item_model.dart';
import 'package:hacker_news/src/resources/api_provider.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

void main() {
  test('First test', fetchTopIds);
  test('Second test', fetchItem);
}

void fetchTopIds() async {
  final api = ApiProvider();
  api.client = MockClient((Request request) async {
    return Response(json.encode([1, 2, 3]), 200);
  });
  final ids = await api.fetchTopIds();
  expect(ids, [1, 2, 3]);
}

void fetchItem() async {
  final api = ApiProvider();
  api.client = MockClient((Request request) async {
    return Response(json.encode({'id': 123}), 200);
  });
  final item = await api.fetchItem(123);
  expect(ItemModel.fromJson({'id': 123}).id, item.id);
}