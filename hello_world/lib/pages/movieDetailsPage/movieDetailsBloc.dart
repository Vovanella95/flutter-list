import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/models/movieVideoModel.dart';
import 'package:hello_world/services/api/imdbApiService.dart';

import '../../dependencies.dart';

//States
abstract class MovieDetailsPageState {
  const MovieDetailsPageState();
}

class MovieDetailsLoadingState extends MovieDetailsPageState {}

class MovieDetailsLoadedState extends MovieDetailsPageState {
  final String author;
  final String description;
  final List<MovieVideoModel> videos;

  const MovieDetailsLoadedState(this.author, this.description, this.videos);
}

//Events
abstract class MovieDetailsEvent {
  const MovieDetailsEvent();
}

class MovieDetailsReceivedEvent extends MovieDetailsEvent {
  final String id;

  const MovieDetailsReceivedEvent(this.id);
}

//Bloc
class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsPageState> {
  ImdbApiService _api = getImdbApiService();
  @override
  MovieDetailsPageState get initialState => MovieDetailsLoadingState();

  @override
  Stream<MovieDetailsPageState> mapEventToState(
      MovieDetailsEvent event) async* {
    if (event is MovieDetailsReceivedEvent) {
      yield MovieDetailsLoadingState();

      final details = await _api.getMovieDetails(event.id);

      final videos = await _api.getMovieVideos(event.id);

      yield MovieDetailsLoadedState(
          details.author, details.description, videos);
    }
  }
}
