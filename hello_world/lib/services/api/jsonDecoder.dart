import 'package:hello_world/services/api/customConverter.dart';
import 'package:hello_world/services/api/moviesApiService/models/searchResponse.dart';

final jsonDecoder = CustomJsonDecoder({
  SearchResponse: SearchResponse.fromJsonFactory,
});