// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moviesApiService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$MoviesApiService extends MoviesApiService {
  _$MoviesApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = MoviesApiService;

  @override
  Future<Response<SearchResponse>> searchMovie(String query) {
    final $url = 'https://imdb8.p.rapidapi.com/title/find';
    final $params = <String, dynamic>{'q': query};
    final $headers = {
      'x-rapidapi-host': 'imdb8.p.rapidapi.com',
      'x-rapidapi-key': 'e66d6144d0msha88246537e1b47cp1527eajsn711906a0d9f0',
      'useQueryString': 'true'
    };
    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<SearchResponse, SearchResponse>($request);
  }

  @override
  Future<Response<SearchResponse>> getMovieDetails(
      String id, int limit, String region) {
    final $url = 'https://imdb8.p.rapidapi.com/title/get-videos';
    final $params = <String, dynamic>{
      'tconst': id,
      'limit': limit,
      'region': region
    };
    final $headers = {
      'x-rapidapi-host': 'imdb8.p.rapidapi.com',
      'x-rapidapi-key': 'e66d6144d0msha88246537e1b47cp1527eajsn711906a0d9f0',
      'useQueryString': 'true'
    };
    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<SearchResponse, SearchResponse>($request);
  }
}
