// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movieDetailsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailsResponse _$MovieDetailsResponseFromJson(Map<String, dynamic> json) {
  return MovieDetailsResponse(
    contentType: json['contentType'] as String ?? '',
    description: json['description'] as String ?? '',
    imageUrl: json['imageUrl'] as String ?? '',
    title: json['title'] as String ?? '',
  )..durationInSeconds = json['durationInSeconds'] as int ?? 0;
}

Map<String, dynamic> _$MovieDetailsResponseToJson(
        MovieDetailsResponse instance) =>
    <String, dynamic>{
      'contentType': instance.contentType,
      'description': instance.description,
      'durationInSeconds': instance.durationInSeconds,
      'imageUrl': instance.imageUrl,
      'title': instance.title,
    };
