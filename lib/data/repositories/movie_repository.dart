import 'package:hetro_anime/consts/strings.dart';
import 'package:hetro_anime/data/api/movie_api.dart';
import 'package:hetro_anime/data/models/movie.dart';
import 'package:hetro_anime/data/models/response_result.dart';

class MovieRepository {
  final MovieApi movieApi;
  MovieRepository(this.movieApi);
  Future<List<Movie>> getAllMoviesPlayNow() async {
    final ResponseResult response = await movieApi.getMoviesPlayNow(
      "Bearer $apiKey",
    );
    return response.results!.map((movie) => Movie.fromJson(movie)).toList();
  }
}
