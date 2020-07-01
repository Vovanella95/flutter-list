import 'package:json_annotation/json_annotation.dart';

part 'movieData.g.dart';

@JsonSerializable()
class MovieData {

  @JsonKey(defaultValue: '')
  String imageUrl;

  @JsonKey(defaultValue: '')
  String title;

  @JsonKey(defaultValue: 0)
  int year;

  @JsonKey(defaultValue: '')
  String titleType;

  @JsonKey(defaultValue: '')
  String id;

  MovieData({this.imageUrl, this.title, this.year, this.titleType, this.id});

  factory MovieData.fromJson(Map<String, dynamic> json) =>
      _$MovieDataFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDataToJson(this);
}