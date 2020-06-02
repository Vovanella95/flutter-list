import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'models/searchResult.dart';

class DetailsRoute extends StatelessWidget {
  SearchResult movieModel;

  DetailsRoute(SearchResult _movieModel) {
    movieModel = _movieModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(28, 28, 28, 1),
        appBar: AppBar(
          title: Text("Details"),
        ),
        body: Stack(
          children: <Widget>[
            Image.network(movieModel.imageUrl),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 12,
                  sigmaY: 12,
                ),
                child: Container(color: Colors.black.withOpacity(0),)
              ),
            ),
            Positioned.fill(
              child: Container(color: Colors.black.withOpacity(0.6),)
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
              SizedBox(height: 16,),
              Text(movieModel.title, style: TextStyle(color: Colors.white, fontSize: 24), textAlign: TextAlign.center,)
            ],)
          ],
        ));
  }
}
