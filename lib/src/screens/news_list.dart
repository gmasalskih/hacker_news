import 'package:flutter/material.dart';
import 'package:hacker_news/src/blocs/stories_provider.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final StoriesBloc bloc = StoriesProvider.of(context).bloc;

    return Scaffold(
      appBar: AppBar(
        title: Text("Top News"),
      ),
      body: buildList(bloc),
    );
  }

  Widget buildList(StoriesBloc bloc) {
    return StreamBuilder(
      stream: bloc.topIds,
      builder: (BuildContext context, AsyncSnapshot<List<int>> snapshot) {
        bloc.fetchTopIds();
        if (!snapshot.hasData) {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return Text('$index - ${snapshot.data[index]}');
            },
          );
        }
      },
    );
  }

//  Widget buildList(StoriesBloc bloc) =>
//      ListView.builder(
//        itemCount: 1100,
//        itemBuilder: (BuildContext context, int index) =>
//            FutureBuilder(
//              future: getFuture(),
//              builder: (BuildContext context, AsyncSnapshot<String> snapshot){
//                return snapshot.hasData ? Text('${snapshot.data} - $index') : Text('Not yet');
//              },
//            ),
//      );
//
//  Future<String> getFuture() =>
//      Future.delayed(
//        Duration(seconds: 5),
//            () => 'Hello',
//      );
}
