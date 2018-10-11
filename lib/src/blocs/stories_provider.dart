import 'package:flutter/material.dart';
import 'package:hacker_news/src/blocs/stories_bloc.dart';
export 'package:hacker_news/src/blocs/stories_bloc.dart';

class StoriesProvider extends InheritedWidget {
  final StoriesBloc bloc;

  StoriesProvider({Key key, Widget child})
      : bloc = StoriesBloc(),
        super(key: key, child: child);

  static StoriesProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(StoriesProvider) as StoriesProvider;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
