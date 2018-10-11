import 'package:flutter/material.dart';
import 'package:hacker_news/src/blocs/stories_provider.dart';
import 'package:hacker_news/src/screens/news_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StoriesProvider(
        child: MaterialApp(
          theme: ThemeData.dark(),
          title: 'Hacker news',
          home: NewsList(),
        ),
      );
}
