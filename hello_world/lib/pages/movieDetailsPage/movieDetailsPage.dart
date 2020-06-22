import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/models/movieModel.dart';
import 'package:hello_world/pages/movieDetailsPage/movieDetailsBloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../dependencies.dart';

class MovieDetailsPage extends StatefulWidget {
  MovieModel movieModel;

  MovieDetailsPage(this.movieModel);

  @override
  State<StatefulWidget> createState() => _MovieDetailsPageState(movieModel);
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  final _bloc = getMovieDetailsBloc();
  MovieModel movieModel;

  _MovieDetailsPageState(MovieModel _movieModel) {
    movieModel = _movieModel;
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  void initState() {
    _bloc.add(new MovieDetailsReceivedEvent(movieModel.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsPageState>(
      bloc: _bloc,
      builder: (context, state) => Scaffold(
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
                  child: Container(
                    color: Colors.black.withOpacity(0),
                  )),
            ),
            Positioned.fill(
                child: Container(
              color: Colors.black.withOpacity(0.6),
            )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Container(
                        child: Image.network(movieModel.imageUrl),
                        height: 200,
                        padding: EdgeInsets.fromLTRB(40, 20, 0, 20),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(12, 28, 12, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              movieModel.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                            createMovieDetailsContent(state)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(16, 16, 16, 4),
                  child: Text(
                    "Videos",
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  height: 160,
                  margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: createVideoCollection(state),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget createVideoCollection(MovieDetailsPageState state) {
    if (state is MovieDetailsLoadedState) {
      return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: state.videos.length,
          itemBuilder: (context, index) {
            var video = state.videos[index];

            return Container(
              width: 160,
              margin: EdgeInsets.fromLTRB(0, 0, 16, 0),
              child: Column(
                children: <Widget>[
                  Image.network(
                    video.imageUrl,
                    width: 160,
                    height: 68,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height:4),
                  Text(
                    video.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            );
          });
    }

    return Center(child: CircularProgressIndicator());
  }

  Widget createMovieDetailsContent(MovieDetailsPageState state) {
    if (state is MovieDetailsLoadedState)
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 4,
          ),
          Text(
            state.author,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(state.description,
              overflow: TextOverflow.ellipsis,
              maxLines: 6,
              style: TextStyle(
                color: Colors.white60,
                fontSize: 14,
              )),
        ],
      );

    return Center(child: CircularProgressIndicator());
  }
}
