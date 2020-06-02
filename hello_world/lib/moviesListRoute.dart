import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/api/imdbApiService.dart';
import 'package:hello_world/models/searchResult.dart';

import 'detailPage.dart';

class _MoviesListRoute extends State<MoviesListRoute> {
  bool isSearching = true;
  String text;

  @override
  build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(28, 28, 28, 1),
      appBar: AppBar(
        title: !isSearching
            ? Text("Second Route 2")
            : TextField(
                onEditingComplete: () {
                  setState(() {
                    this.isSearching = false;
                  });
                },
                onChanged: (text) {
                  this.text = text;
                },
                decoration: InputDecoration(
                  hintText: "Search...",
                  icon: Icon(Icons.search),
                ),
              ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                this.isSearching = !this.isSearching;
              });
            },
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(),
        child: isSearching ? null : generateMoviesListView(text),
      ),
    );
  }

  FutureBuilder generateMoviesListView(String text) {
    if (text == null || text.isEmpty) {
      return null;
    }

    return FutureBuilder(
        future: ImdbApiService().searchMovie(text),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              var item = snapshot.data as List<SearchResult>;
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailsRoute(item.elementAt(index));
                  }));
                },
                child: SizedBox(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(8, 8, 0, 0),
                    child: Row(children: <Widget>[
                      Container(
                        child: Image.network(
                          item.elementAt(index).imageUrl,
                          width: 80,
                          height: 120,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              item.elementAt(index).title,
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              item.elementAt(index).titleType,
                              style: TextStyle(
                                color: Color.fromRGBO(180, 180, 190, 1),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                  height: 100,
                ),
              );
            },
          );
        });
  }
}

class MoviesListRoute extends StatefulWidget {
  @override
  _MoviesListRoute createState() => _MoviesListRoute();
}
