import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/models/movieVideoModel.dart';
import 'package:hello_world/pages/movieDetailsPage/movieDetailsPage.dart';

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

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsPageState> {
  @override
  MovieDetailsPageState get initialState => MovieDetailsLoadingState();

  @override
  Stream<MovieDetailsPageState> mapEventToState(
      MovieDetailsEvent event) async* {
    if (event is MovieDetailsReceivedEvent) {
      yield MovieDetailsLoadingState();
      final details = await imdbApiService.getMovieDetails(event.id);

      final videos = await imdbApiService.getMovieVideos(event.id);

      yield MovieDetailsLoadedState(details.author, details.description, videos);
    }
  }
}
