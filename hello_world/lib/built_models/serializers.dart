import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

import 'built_movie.dart';

part 'serializers.g.dart';

@SerializersFor(const [BuiltMovie, MovieLanguage])
final Serializers serializers = _$serializers;
