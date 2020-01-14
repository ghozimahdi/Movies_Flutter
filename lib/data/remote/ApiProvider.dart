import 'package:http/http.dart';

class ApiProvider {
  var client = Client();
  final _apiKey = "52b26ca302bf3a2dd288dd286f6c633d";

  Future<String> fetchMovieList() async {
    print("entered");
    final response = await client
        .get("http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey");
    print(response.body.toString());
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
