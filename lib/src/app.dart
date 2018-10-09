import 'package:flutter/material.dart';
import 'package:hacker_news/src/screens/news_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData.dark(),
        title: 'Hacker news',
        home: NewsList(),
      );
}
