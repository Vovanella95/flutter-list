import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/models/movieModel.dart';
import 'package:hello_world/pages/animations/animated_builder_page.dart';
import 'package:hello_world/pages/animations/explict_animations_page.dart';
import 'package:hello_world/pages/animations/implict_animations_page.dart';
import 'package:hello_world/pages/movieDetailsPage/movieDetailsPage.dart';
import 'package:hello_world/pages/moviesList/moviesListPage.dart';
import 'package:hello_world/pages/startPage/startPage.dart';
import 'package:hello_world/services/navigation/routes.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case startPageRoute:
        return MaterialPageRoute(builder: (_) => StartPage());
      case moviesListRoute:
        return MaterialPageRoute(builder: (_) => MoviesListPage());
      case movieDetailsRoute:
        return MaterialPageRoute(
            builder: (_) => MovieDetailsPage(settings.arguments as MovieModel));
      case implictAnimationsRoute:
        return MaterialPageRoute(builder: (_) => ImplictAnimationsPage());
      case explictNicokasCageAnimation:
        return MaterialPageRoute(builder: (_) => ExplictAnimationsPage());
      case animationBuilderRoute:
        return MaterialPageRoute(builder: (_) => AnimatedBuilderPage());
      default:
        throw new Exception("Route is not defined");
    }
  }
}
