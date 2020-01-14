import 'package:movies_flutter/data/Repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc {
  final _repository = Repository();
  final _moviesFetcher = PublishSubject<String>();

  Observable<String> get allMovies => _moviesFetcher.stream;

  fetchAllMovies() async {
    String json = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(json);
  }

  dispose() {
    _moviesFetcher.close();
  }
}

final bloc = MoviesBloc();
