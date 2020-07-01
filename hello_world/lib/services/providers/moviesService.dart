import 'package:hello_world/models/movieModel.dart';
import 'package:hello_world/services/api/moviesApiService/moviesApiService.dart';

class MoviesService {
  MoviesApiService _api = MoviesApiService.create();

  Future<List<MovieModel>> searchMovie(String query) async {
    var result = await _api.searchMovie(query);
    return result.body.results
        .map((e) => MovieModel(e.imageUrl, e.title, e.year, e.titleType, e.id));
  }
}
