import 'package:json_annotation/json_annotation.dart';

part 'movieDetailsResponse.g.dart';

@JsonSerializable()
class MovieDetailsResponse {
  @JsonKey(defaultValue: '')
  String contentType;

  @JsonKey(defaultValue: '')
  String description;

  @JsonKey(defaultValue: 0)
  int durationInSeconds;

  @JsonKey(defaultValue: '')
  String imageUrl;

  @JsonKey(defaultValue: '')
  String title;

  MovieDetailsResponse(
      {this.contentType, this.description, this.imageUrl, this.title});

  factory MovieDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsResponseToJson(this);
}
