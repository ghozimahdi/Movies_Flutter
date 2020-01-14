import 'package:movies_flutter/data/remote/ApiProvider.dart';

class Repository {
  final apiProvider = ApiProvider();

  Future<String> fetchAllMovies() => apiProvider.fetchMovieList();
}
