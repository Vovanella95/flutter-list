import 'package:get_it/get_it.dart';
import 'package:hello_world/pages/movieDetailsPage/movieDetailsBloc.dart';
import 'package:hello_world/pages/moviesList/moviesListBloc.dart';
import 'package:hello_world/services/api/imdbApiService.dart';
import 'package:hello_world/services/api/moviesApiService/moviesApiService.dart';
import 'package:hello_world/services/caching/database_provider.dart';
import 'package:hello_world/services/navigation/navigationService.dart';
import 'package:hello_world/services/providers/moviesService.dart';

final getIt = GetIt.instance;

void setup() {
  //Blocs
  getIt.registerFactory(() => MovieDetailsBloc());
  getIt.registerFactory(() => MoviesListBloc());

  //Services
  getIt.registerFactory(() => ImdbApiService());
  getIt.registerSingleton(() => MoviesApiService.create());
  getIt.registerLazySingleton(() => NavigationService());
  getIt.registerLazySingleton(() => DatabaseProvider());
  getIt.registerLazySingleton(() => MoviesService());
}

ImdbApiService getImdbApiService() => getIt.get<ImdbApiService>();
MovieDetailsBloc getMovieDetailsBloc() => getIt.get<MovieDetailsBloc>();
MoviesListBloc getMoviesListBloc() => getIt.get<MoviesListBloc>();
NavigationService getNavigationService() => getIt.get<NavigationService>();
MoviesService getMoviesService() => getIt.get<MoviesService>();
DatabaseProvider getDatabaseProvider() => getIt.get<DatabaseProvider>();
MoviesApiService getMoviesApiService() => getIt.get<MoviesApiService>();
