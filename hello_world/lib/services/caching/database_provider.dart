import 'package:hello_world/models/movieModel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static const String dbName = "movies.db";
  Future<Database> openMoviesDatabase() async {
    var directory = await getApplicationDocumentsDirectory();

    String path = directory.path + dbName;

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Movies ("
          "id TEXT primary key,"
          "title TEXT,"
          "imageUrl TEXT,"
          "year integer,"
          "titleType TEXT"
          ")");
    });
  }

  Future addMoviesAsync(List<MovieModel> movies) async {
    var db = await openMoviesDatabase();

    for (int i = 0; i < movies.length; i++) {
      await db.insert("Movies", movies[i].toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }

    db.close();
  }

  Future deleteAllMoviesAsync() async {
    var db = await openMoviesDatabase();

    db.delete("Movies");
    db.close();
  }

  Future<List<MovieModel>> getMoviesAsync() async {
    var db = await openMoviesDatabase();

    var resultQuery = await db.query("Movies");

    db.close();

    var result = List<MovieModel>();

    for (int i = 0; i < resultQuery.length; i++) {
      result.add(MovieModel.fromMap(resultQuery[i]));
    }

    return result;
  }
}
