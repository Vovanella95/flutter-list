import 'dart:collection';
import 'dart:convert';
import 'package:hello_world/models/newModel.dart';
import 'package:hello_world/models/searchResult.dart';
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

  Future<List<NewModel>> getTopStripe() async {
    var result = await http.get(
        "https://imdb8.p.rapidapi.com/title/get-news?limit=25&tconst=tt0944947",
        headers: generateApiHeaders());

    Map<String, dynamic> deserializedList = jsonDecode(result.body);

    var results = List<dynamic>.from(deserializedList["items"]);
    return results.map((e) => NewModel.fromJson(e)).toList();
  }

  Future<List<SearchResult>> searchMovie(String query) async {
    var result = await http.get(
        "https://imdb8.p.rapidapi.com/title/find?q=$query",
        headers: generateApiHeaders());

    Map<String, dynamic> deserializedList = jsonDecode(result.body);

    var results = List<dynamic>.from(deserializedList["results"]);
    return results
        .map((e) => SearchResult.fromJson(e))
        .where((i) => i.title != null)
        .toList();
  }
}
