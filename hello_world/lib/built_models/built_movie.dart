library built_movie;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hello_world/built_models/serializers.dart';

part 'built_movie.g.dart';

abstract class BuiltMovie implements Built<BuiltMovie, BuiltMovieBuilder> {
  @nullable
  int get id;

  String get title;
  String get imageUrl;
  BuiltList<String> get genres;
  BuiltList<MovieLanguage> get supportedLanguages;

  BuiltMovie._();

  factory BuiltMovie([updates(BuiltMovieBuilder b)]) = _$BuiltMovie;

  static Serializer<BuiltMovie> get serializer => _$builtMovieSerializer;

  String toJson() {
    return json.encode(serializers.serializeWith(BuiltMovie.serializer, this));
  }

  static BuiltMovie fromJson(String jsonString) {
    return serializers.deserializeWith(
        BuiltMovie.serializer, json.decode(jsonString));
  }
}

class MovieLanguage extends EnumClass {
  static const MovieLanguage en = _$en;
  static const MovieLanguage ru = _$ru;
  static const MovieLanguage by = _$by;

  const MovieLanguage._(String name) : super(name);

  static BuiltSet<MovieLanguage> get values => _$values;
  static MovieLanguage valueOf(String name) => _$valueOf(name);

  static Serializer<MovieLanguage> get serializer => _$movieLanguageSerializer;
}
