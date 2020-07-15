import 'package:hello_world/dependencies.dart';
import 'package:hello_world/models/movieModel.dart';
import 'package:hello_world/services/api/imdbApiService.dart';
import 'package:hello_world/services/caching/database_provider.dart';

class MoviesService {
  MoviesService() {
    _api = getImdbApiService();
    _db = getDatabaseProvider();
  }

  MoviesService.fromServices(this._api, this._db);

  ImdbApiService _api;
  DatabaseProvider _db;

  Future<List<MovieModel>> searchMovie(String query) async {
    var results = await _api.searchMovie(query);

    return results;
  }

  Future<List<MovieModel>> getCachedMovied() async {
    return await _db.getMoviesAsync();
  }
}
