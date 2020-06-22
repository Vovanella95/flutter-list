import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/models/movieModel.dart';

import '../../dependencies.dart';

// States
abstract class SearchingState {
  const SearchingState();
}

class BusyState extends SearchingState {}

class EmptyState extends SearchingState {}

class InitialState extends SearchingState {}

// Events
abstract class MoviesListEvents {
  const MoviesListEvents();
}

class TextChangedEvent extends MoviesListEvents {
  final String query;

  const TextChangedEvent(this.query);
}

class SearchIconClicked extends MoviesListEvents {}

class SearchCompletedEvent extends MoviesListEvents {}

// Bloc
class MoviesListBloc extends Bloc<MoviesListEvents, SearchingState> {
  final _api = getImdbApiService();

  bool isSearching = false;
  String query = "";
  List<MovieModel> items = [];

  @override
  SearchingState get initialState => EmptyState();

  @override
  Stream<SearchingState> mapEventToState(MoviesListEvents event) async* {
    if (event is TextChangedEvent) {
      yield* handleTextChanged(event.query);
    } else if (event is SearchIconClicked) {
      yield* handleSearchIconClicked();
    } else if (event is SearchCompletedEvent) {
      yield* handleSearchCompleted();
    }
  } // IoC + Navigation keys + cache + chopper

  Stream<SearchingState> handleSearchIconClicked() async* {
    isSearching = !isSearching;

    if (isSearching) {
      query = "";
      yield EmptyState();
    } else {
      yield* handleSearchCompleted();
    }
  }

  Stream<SearchingState> handleSearchCompleted() async* {
    isSearching = false;
    yield BusyState();
    items = await _api.searchMovie(query);
    yield InitialState();
  }

  Stream<SearchingState> handleTextChanged(String query) async* {
    this.query = query;
    yield BusyState();
  }
}
