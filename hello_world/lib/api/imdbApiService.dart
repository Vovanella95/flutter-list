import 'dart:collection';
import 'dart:convert';
import 'package:hello_world/dataModels/expandedMovieData.dart';
import 'package:hello_world/dataModels/movieVideoData.dart';
import 'package:hello_world/dataModels/searchResult.dart';
import 'package:hello_world/models/expandedMovieModel.dart';
import 'package:hello_world/models/movieModel.dart';
import 'package:hello_world/models/movieVideoModel.dart';
import 'package:http/http.dart' as http;

class ImdbApiService {
  Map<String, String> generateApiHeaders() {
    Map<String, String> headers = new HashMap();

    headers.putIfAbsent("x-rapidapi-host", () => "imdb8.p.rapidapi.com");
    headers.putIfAbsent("x-rapidapi-key",
        () => "e66d6144d0msha88246537e1b47cp1527eajsn711906a0d9f0");
    headers.putIfAbsent("useQueryString", () => "true");

    return headers;
  }

  Future<List<MovieModel>> searchMovie(String query) async {
    var result = await http.get(
        "https://imdb8.p.rapidapi.com/title/find?q=$query",
        headers: generateApiHeaders());

    Map<String, dynamic> deserializedList = jsonDecode(result.body);

    var results = List<dynamic>.from(deserializedList["results"]);
    return results
        .map((e) => SearchResultData.fromJson(e))
        .map(mapSearchResultToMovieModel)
        .where((i) => i.title != null)
        .toList();
  }

  Future<ExpandedMovieModel> getMovieDetails(String id) async {
    var neededId = id.substring(7, id.length - 1);
    var result = await http.get(
        "https://imdb8.p.rapidapi.com/title/get-overview-details?currentCountry=US&tconst=$neededId",
        headers: generateApiHeaders());

    Map<String, dynamic> details = jsonDecode(result.body);

    var resultModel = ExpandedMovieData.fromJson(details);

    return mapExpandedMovieToExpandedMovieModel(resultModel);
  }

  Future<List<MovieVideoModel>> getMovieVideos(String id) async {
    var neededId = id.substring(7, id.length - 1);
    var result = await http.get(
        "https://imdb8.p.rapidapi.com/title/get-videos?limit=12&region=US&tconst=$neededId",
        headers: generateApiHeaders());

    Map<String, dynamic> deserializedList = jsonDecode(result.body);

    final resource = deserializedList["resource"];
    var results = List<dynamic>.from(resource["videos"]);

    return results
        .map((e) => MovieVideoData.fromJson(e))
        .map(mapMovieVideoToMovieVideoModel)
        .toList();
  }



  //Mappings
  MovieModel mapSearchResultToMovieModel(SearchResultData searchResult) {
    return MovieModel(searchResult.imageUrl, searchResult.title,
        searchResult.year, searchResult.titleType, searchResult.id);
  }

  ExpandedMovieModel mapExpandedMovieToExpandedMovieModel(
      ExpandedMovieData data) {
    return ExpandedMovieModel(data.description, data.author);
  }

  MovieVideoModel mapMovieVideoToMovieVideoModel(MovieVideoData data)
  {
    return MovieVideoModel(data.title, data.description, data.contentType, data.durationInSeconds, data.imageUrl);
  }
}
