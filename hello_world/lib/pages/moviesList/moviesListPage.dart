import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/services/navigation/routes.dart';
import '../../dependencies.dart';
import 'moviesListBloc.dart';

class MoviesListPage extends StatefulWidget {
  @override
  _MoviesListPageState createState() => _MoviesListPageState();
}

class _MoviesListPageState extends State<MoviesListPage> {
  final _bloc = getMoviesListBloc();
  TextEditingController _searchController = TextEditingController();

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
          title: !_bloc.isSearching
              ? Text(_bloc.query.isEmpty ? "Search anything..." : _bloc.query, style: TextStyle(fontFamily: 'JosefinSans'),)
              : TextField(
                  controller: _searchController,
                  onEditingComplete: () {
                    _bloc.add(new SearchCompletedEvent());
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
                _bloc.add(new SearchIconClicked());
              },
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(),
          child: generateMoviesListView(_bloc.query),
        ),
      ),
    );
  }

  Widget generateMoviesListView(String text) {
    if (_bloc.state is EmptyState) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.search,
              color: Color.fromRGBO(64, 64, 64, 1),
              size: 48,
            ),
            Text(
              "Search something",
              style: TextStyle(
                color: Color.fromRGBO(64, 64, 64, 1),
                fontSize: 18,
              ),
            ),
          ],
        ),
      );
    } else if (_bloc.state is BusyState) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return ListView.builder(
      itemCount: _bloc.items.length,
      itemBuilder: (context, index) {
        var item = _bloc.items[index];
        return InkWell(
          onTap: () {
            getNavigationService().navigateTo(movieDetailsRoute, item);
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
                        style: TextStyle(color: Colors.white, fontFamily: 'JosefinSans'),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        item.titleType,
                        style: TextStyle(
                          fontFamily: 'JosefinSans',
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
