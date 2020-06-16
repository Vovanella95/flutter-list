import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/api/imdbApiService.dart';
import 'package:hello_world/models/movieModel.dart';

// States
abstract class SearchingState {
  const SearchingState();
}

class BusyState extends SearchingState {}

class InitialState extends SearchingState {}

// Events
abstract class MoviesListEvents {
  const MoviesListEvents();
}

class TextChangedEvent extends MoviesListEvents {
  final String query;

  const TextChangedEvent(this.query);
}

class SearchStartedEvent extends MoviesListEvents {}

class SearchCompletedEvent extends MoviesListEvents {}

// Bloc
class MoviesListBloc extends Bloc<MoviesListEvents, SearchingState> {
  var _apiService = ImdbApiService();

  bool isSearching = false;
  String query;
  List<MovieModel> items = [];

  @override
  SearchingState get initialState => InitialState();

  @override
  Stream<SearchingState> mapEventToState(MoviesListEvents event) async* {
    if (event is TextChangedEvent) {
      yield* handleTextChanged(event.query);
    }

    if (event is SearchStartedEvent) {
      yield* handleSearchStatred();
    }

    if (event is SearchCompletedEvent) {
      yield* handleSearchCompleted();
    }
  }

  Stream<SearchingState> handleSearchStatred() async* {
    isSearching = true;
    yield BusyState();
  }

  Stream<SearchingState> handleSearchCompleted() async* {
    isSearching = false;
    yield BusyState();
    items = await _apiService.searchMovie(query);
    yield InitialState();
  }

  Stream<SearchingState> handleTextChanged(String query) async* {
    this.query = query;
    yield BusyState();
  }
}
