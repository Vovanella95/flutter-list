import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/models/movieModel.dart';
import 'package:hello_world/pages/movieDetailsPage/movieDetailsPage.dart';
import 'package:hello_world/pages/moviesList/moviesListPage.dart';
import 'package:hello_world/services/navigation/routes.dart';
import '../../main.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case startPageRoute:
        return MaterialPageRoute(builder: (_) => MyHomePage());
      case moviesListRoute:
        return MaterialPageRoute(builder: (_) => MoviesListPage());
      case movieDetailsRoute:
        return MaterialPageRoute(
            builder: (_) => MovieDetailsPage(settings.arguments as MovieModel));
      default:
        throw new Exception("Route is not defined");
    }
  }
}
