import 'package:hello_world/dependencies.dart';
import 'package:hello_world/models/movieModel.dart';
import 'package:hello_world/services/api/imdbApiService.dart';
import 'package:hello_world/services/caching/database_provider.dart';

class MoviesService {
  ImdbApiService _api = getImdbApiService();
  DatabaseProvider _db = getDatabaseProvider();

  Future<List<MovieModel>> searchMovie(String query) async {
    var results = await _api.searchMovie(query);

    if (results.isEmpty) {
      results = await _db.getMoviesAsync();
    }

    await _db.deleteAllMoviesAsync();

    await _db.addMoviesAsync(results);

    return results;
  }
}
