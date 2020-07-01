import 'package:chopper/chopper.dart';
import 'package:hello_world/services/api/customConverter.dart';
import 'package:hello_world/services/api/moviesApiService/models/searchResponse.dart';

part 'moviesApiService.chopper.dart';

@ChopperApi(baseUrl: 'https://imdb8.p.rapidapi.com')
abstract class MoviesApiService extends ChopperService {

static const String host = 'imdb8.p.rapidapi.com';
static const String key = 'e66d6144d0msha88246537e1b47cp1527eajsn711906a0d9f0';

  @Get(headers: {
    'x-rapidapi-host': host,
    'x-rapidapi-key': key,
    'useQueryString': 'true',
  }, path: '/title/find')
  Future<Response<SearchResponse>> searchMovie(@Query('q') String query);


  @Get(headers: {
    'x-rapidapi-host': host,
    'x-rapidapi-key': key,
    'useQueryString': 'true',
  }, path: '/title/get-overview-details')
  Future<Response<SearchResponse>> getMovieDetails(@Query('tconst') String id, @Query('limit') int limit, @Query('region') String region);


  static MoviesApiService create() {
    final client = ChopperClient(
        baseUrl: 'https://imdb8.p.rapidapi.com',
        services: [
          _$MoviesApiService(),
        ],
        converter: JsonSerializableConverter());

    return _$MoviesApiService(client);
  }
}
