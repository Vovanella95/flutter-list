import 'package:hello_world/services/api/moviesApiService/models/movieData.dart';
import 'package:json_annotation/json_annotation.dart';

part 'searchResponse.g.dart';

@JsonSerializable()
class SearchResponse {
  @JsonKey(defaultValue: [])
  List<MovieData> results;

  SearchResponse({this.results});
  static const fromJsonFactory = _$SearchResponseFromJson;

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);
}
