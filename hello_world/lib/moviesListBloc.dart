import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/api/imdbApiService.dart';
import 'package:hello_world/models/searchResult.dart';

abstract class SearchingState {
  const SearchingState();
}

class BusyState extends SearchingState {

}

class InitialState extends SearchingState{

}

abstract class MoviesListEvents {
//1 text entered
//2 item clicked -> navigation

  const MoviesListEvents();
}

class TextChangedEvent extends MoviesListEvents {
  final String query;

  const TextChangedEvent(this.query);
}



class MoviesListBloc extends Bloc<MoviesListEvents, SearchingState> {
  var _apiService = ImdbApiService();

  List<SearchResult> items = [];

  @override
  SearchingState get initialState => InitialState();

  @override
  Stream<SearchingState> mapEventToState(MoviesListEvents event) async* {
    if (event is TextChangedEvent) {
      yield* handleTextChanged(event.query);
    }
  }

  Stream<SearchingState> handleTextChanged(String query) async* {
    if (query.length < 1) return;
    yield BusyState();
    items = await _apiService.searchMovie(query);
    yield InitialState();
  }
}
