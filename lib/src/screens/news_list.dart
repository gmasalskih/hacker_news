import 'dart:async';

import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          title: Text("Top News"),
        ),
        body: Text('Hi'),
      );

//  Widget buildList() =>
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