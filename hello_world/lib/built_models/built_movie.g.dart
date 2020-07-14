// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_movie;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const MovieLanguage _$en = const MovieLanguage._('en');
const MovieLanguage _$ru = const MovieLanguage._('ru');
const MovieLanguage _$by = const MovieLanguage._('by');

MovieLanguage _$valueOf(String name) {
  switch (name) {
    case 'en':
      return _$en;
    case 'ru':
      return _$ru;
    case 'by':
      return _$by;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<MovieLanguage> _$values =
    new BuiltSet<MovieLanguage>(const <MovieLanguage>[
  _$en,
  _$ru,
  _$by,
]);

Serializer<BuiltMovie> _$builtMovieSerializer = new _$BuiltMovieSerializer();
Serializer<MovieLanguage> _$movieLanguageSerializer =
    new _$MovieLanguageSerializer();

class _$BuiltMovieSerializer implements StructuredSerializer<BuiltMovie> {
  @override
  final Iterable<Type> types = const [BuiltMovie, _$BuiltMovie];
  @override
  final String wireName = 'BuiltMovie';

  @override
  Iterable<Object> serialize(Serializers serializers, BuiltMovie object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'imageUrl',
      serializers.serialize(object.imageUrl,
          specifiedType: const FullType(String)),
      'genres',
      serializers.serialize(object.genres,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'supportedLanguages',
      serializers.serialize(object.supportedLanguages,
          specifiedType:
              const FullType(BuiltList, const [const FullType(MovieLanguage)])),
    ];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  BuiltMovie deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BuiltMovieBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'imageUrl':
          result.imageUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'genres':
          result.genres.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'supportedLanguages':
          result.supportedLanguages.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(MovieLanguage)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$MovieLanguageSerializer implements PrimitiveSerializer<MovieLanguage> {
  @override
  final Iterable<Type> types = const <Type>[MovieLanguage];
  @override
  final String wireName = 'MovieLanguage';

  @override
  Object serialize(Serializers serializers, MovieLanguage object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  MovieLanguage deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      MovieLanguage.valueOf(serialized as String);
}

class _$BuiltMovie extends BuiltMovie {
  @override
  final int id;
  @override
  final String title;
  @override
  final String imageUrl;
  @override
  final BuiltList<String> genres;
  @override
  final BuiltList<MovieLanguage> supportedLanguages;

  factory _$BuiltMovie([void Function(BuiltMovieBuilder) updates]) =>
      (new BuiltMovieBuilder()..update(updates)).build();

  _$BuiltMovie._(
      {this.id,
      this.title,
      this.imageUrl,
      this.genres,
      this.supportedLanguages})
      : super._() {
    if (title == null) {
      throw new BuiltValueNullFieldError('BuiltMovie', 'title');
    }
    if (imageUrl == null) {
      throw new BuiltValueNullFieldError('BuiltMovie', 'imageUrl');
    }
    if (genres == null) {
      throw new BuiltValueNullFieldError('BuiltMovie', 'genres');
    }
    if (supportedLanguages == null) {
      throw new BuiltValueNullFieldError('BuiltMovie', 'supportedLanguages');
    }
  }

  @override
  BuiltMovie rebuild(void Function(BuiltMovieBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BuiltMovieBuilder toBuilder() => new BuiltMovieBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BuiltMovie &&
        id == other.id &&
        title == other.title &&
        imageUrl == other.imageUrl &&
        genres == other.genres &&
        supportedLanguages == other.supportedLanguages;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), title.hashCode), imageUrl.hashCode),
            genres.hashCode),
        supportedLanguages.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BuiltMovie')
          ..add('id', id)
          ..add('title', title)
          ..add('imageUrl', imageUrl)
          ..add('genres', genres)
          ..add('supportedLanguages', supportedLanguages))
        .toString();
  }
}

class BuiltMovieBuilder implements Builder<BuiltMovie, BuiltMovieBuilder> {
  _$BuiltMovie _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _imageUrl;
  String get imageUrl => _$this._imageUrl;
  set imageUrl(String imageUrl) => _$this._imageUrl = imageUrl;

  ListBuilder<String> _genres;
  ListBuilder<String> get genres =>
      _$this._genres ??= new ListBuilder<String>();
  set genres(ListBuilder<String> genres) => _$this._genres = genres;

  ListBuilder<MovieLanguage> _supportedLanguages;
  ListBuilder<MovieLanguage> get supportedLanguages =>
      _$this._supportedLanguages ??= new ListBuilder<MovieLanguage>();
  set supportedLanguages(ListBuilder<MovieLanguage> supportedLanguages) =>
      _$this._supportedLanguages = supportedLanguages;

  BuiltMovieBuilder();

  BuiltMovieBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _title = _$v.title;
      _imageUrl = _$v.imageUrl;
      _genres = _$v.genres?.toBuilder();
      _supportedLanguages = _$v.supportedLanguages?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BuiltMovie other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BuiltMovie;
  }

  @override
  void update(void Function(BuiltMovieBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BuiltMovie build() {
    _$BuiltMovie _$result;
    try {
      _$result = _$v ??
          new _$BuiltMovie._(
              id: id,
              title: title,
              imageUrl: imageUrl,
              genres: genres.build(),
              supportedLanguages: supportedLanguages.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'genres';
        genres.build();
        _$failedField = 'supportedLanguages';
        supportedLanguages.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'BuiltMovie', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
