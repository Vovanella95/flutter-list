import 'package:get_it/get_it.dart';
import 'package:hello_world/pages/movieDetailsPage/movieDetailsBloc.dart';
import 'package:hello_world/pages/moviesList/moviesListBloc.dart';
import 'package:hello_world/services/api/imdbApiService.dart';
import 'package:hello_world/services/navigation/navigationService.dart';

final getIt = GetIt.instance;

void setup() {
  //Blocs
  getIt.registerFactory(() => MovieDetailsBloc());
  getIt.registerFactory(() => MoviesListBloc());

  //Services
  getIt.registerFactory(() => ImdbApiService());
  getIt.registerLazySingleton(() => NavigationService());
}

ImdbApiService getImdbApiService() => getIt.get<ImdbApiService>();
MovieDetailsBloc getMovieDetailsBloc() => getIt.get<MovieDetailsBloc>();
MoviesListBloc getMoviesListBloc() => getIt.get<MoviesListBloc>();
NavigationService getNavigationService() => getIt.get<NavigationService>();