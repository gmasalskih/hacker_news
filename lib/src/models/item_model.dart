import 'dart:convert';

class ItemModel {
  final int id;
  final bool deleted;
  final String type;
  final String by;
  final int time;
  final String text;
  final bool dead;
  final int parent;
  final List<dynamic> kids;
  final String url;
  final int score;
  final String title;
  final int descendants;

  ItemModel.fromJson(Map<String, dynamic> parseJson)
      : id = parseJson['id'],
        deleted = parseJson['deleted'] ?? false,
        type = parseJson['type'],
        by = parseJson['by'],
        time = parseJson['time'],
        text = parseJson['text'] ?? '',
        dead = parseJson['dead'] ?? false,
        parent = parseJson['parent'],
        kids = parseJson['kids'] ?? [],
        url = parseJson['url'],
        score = parseJson['score'],
        title = parseJson['title'],
        descendants = parseJson['descendants'];

  ItemModel.fromDb(Map<String, dynamic> parseJson)
      : id = parseJson['id'],
        deleted = parseJson['deleted'] == 0 ? false : true,
        type = parseJson['type'],
        by = parseJson['by'],
        time = parseJson['time'],
        text = parseJson['text'],
        dead = parseJson['dead'] == 0 ? false : true,
        parent = parseJson['parent'],
        kids = jsonDecode(parseJson['kids']),
        url = parseJson['url'],
        score = parseJson['score'],
        title = parseJson['title'],
        descendants = parseJson['descendants'];

  Map<String, dynamic> toMapForDb() {
    return <String, dynamic>{
      'id': id,
      'deleted': deleted?1:0,
      'type': type,
      'by': by,
      'time': time,
      'text': text,
      'dead': dead?1:0,
      'parent': parent,
      'kids': jsonEncode(kids),
      'url': url,
      'score': score,
      'title': title,
      'descendants': descendants
    };
  }
}
