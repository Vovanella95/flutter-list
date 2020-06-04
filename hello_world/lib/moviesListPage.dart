import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/api/imdbApiService.dart';
import 'package:hello_world/models/searchResult.dart';
import 'package:hello_world/moviesListBloc.dart';
import 'detailPage.dart';

class MoviesListPage extends StatefulWidget {
  @override
  _MoviesListPageState createState() => _MoviesListPageState();
}

class _MoviesListPageState extends State<MoviesListPage> {
  bool isSearching = true;

  final _bloc = MoviesListBloc();

  TextEditingController _searchController = TextEditingController();
  String text;

  @override
  void initState() {
    _searchController.addListener(() {
      _bloc.add(TextChangedEvent(_searchController.text));
    });
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    _searchController.dispose();
    super.dispose();
  }

  @override
  build(BuildContext context) {
    return BlocBuilder<MoviesListBloc, SearchingState>(
      bloc: _bloc,
      builder: (context, state) => Scaffold(
        backgroundColor: Color.fromRGBO(28, 28, 28, 1),
        appBar: AppBar(
          title: !isSearching
              ? Text("Second Route 2")
              : TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: "Search...",
                    icon: Icon(Icons.search),
                  ),
                ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(),
          child: generateMoviesListView(text),
        ),
      ),
    );
  }

  Widget generateMoviesListView(String text) {
    if (_bloc.state is BusyState) {
      return Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
      itemCount: _bloc.items.length,
      itemBuilder: (context, index) {
        var item = _bloc.items[index];
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailsRoute(item);
            }));
          },
          child: SizedBox(
            child: Container(
              padding: EdgeInsets.fromLTRB(8, 8, 0, 0),
              child: Row(children: <Widget>[
                Container(
                  child: Image.network(
                    item.imageUrl,
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
                        item.title,
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        item.titleType,
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
  }
}
