import 'package:hello_world/models/movieModel.dart';
import 'package:hello_world/services/api/imdbApiService.dart';
import 'package:hello_world/services/providers/moviesService.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockImdbApiService extends Mock implements ImdbApiService {}

main() {
  group('searchMovie', () {
    MoviesService _sut;
    final service = MockImdbApiService();

    when(service.searchMovie("the...")).thenAnswer((_) async => Future.value({
          MovieModel("image", "title", 2020, "genre", "id"),
          MovieModel("image", "title", 2020, "genre", "id")
        }.toList()));

    setUpAll(() {
      _sut = new MoviesService.fromServices(service, null);
    });

    test('should return movies list fetched from backend', () async {
      var result = await _sut.searchMovie("the...");
      expect(result.length, 2);
    });
  });
}
