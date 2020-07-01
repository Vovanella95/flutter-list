// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movieData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieData _$MovieDataFromJson(Map<String, dynamic> json) {
  return MovieData(
    imageUrl: json['imageUrl'] as String ?? '',
    title: json['title'] as String ?? '',
    year: json['year'] as int ?? 0,
    titleType: json['titleType'] as String ?? '',
    id: json['id'] as String ?? '',
  );
}

Map<String, dynamic> _$MovieDataToJson(MovieData instance) => <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'title': instance.title,
      'year': instance.year,
      'titleType': instance.titleType,
      'id': instance.id,
    };
