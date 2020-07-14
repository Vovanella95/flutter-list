import 'package:hello_world/built_models/built_movie.dart';

class CodeRunner {
  static bool compareTwoModels() {
    var movie = BuiltMovie((b) => b
      ..title = 'Game of thrones'
      ..supportedLanguages.addAll([MovieLanguage.by])
      ..imageUrl = 'http://images.org/1.jpg'
      ..genres.addAll(['action', 'adventure']));

    var copiedMovie = movie.rebuild((m) => m..title = 'Prince of Persia');

    print(movie);
    print(copiedMovie.toJson());

    return movie == copiedMovie;
  }
}
