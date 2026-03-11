import 'package:hetro_anime/consts/strings.dart';
import 'package:hetro_anime/data/api/movie_api.dart';
import 'package:hetro_anime/data/exception_handeler/api_result.dart';
import 'package:hetro_anime/data/exception_handeler/network_exception.dart';
import 'package:hetro_anime/data/models/movie.dart';
import 'package:hetro_anime/data/models/response_result.dart';

class MovieRepository {
  final MovieApi movieApi;
  MovieRepository(this.movieApi);
  Future<ApiResult<List<Movie>>> getAllMoviesPlayNow() async {
    try {
      final ResponseResult response = await movieApi.getMoviesPlayNow(
        "Bearer $apiKey",
      );
      final List<Movie> listMovies = response.results!;
      return ApiResult.success(listMovies);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<List<Movie>>> getAllMoviesUpcoming() async {
    try {
      final ResponseResult response = await movieApi.getMoviesUpcoming(
        "Bearer $apiKey",
      );
      final List<Movie> listMovies = response.results!;
      return ApiResult.success(listMovies);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<List<Movie>>> getAllMoviesTopRated() async {
    try {
      final ResponseResult response = await movieApi.getMoviesTopRated(
        "Bearer $apiKey",
      );
      final List<Movie> listMovies = response.results!;
      return ApiResult.success(listMovies);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<List<Movie>>> getAllMoviesPopular() async {
    try {
      final ResponseResult response = await movieApi.getMoviesPopular(
        "Bearer $apiKey",
      );
      final List<Movie> listMovies = response.results!;
      return ApiResult.success(listMovies);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<Movie>> getMovieById(int movieId) async {
    try {
      final Movie response = await movieApi.getMovieById(
        movieId,
        "Bearer $apiKey",
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<List<Movie>>> getMovieSearched(String movieQury) async {
    try {
      final ResponseResult response = await movieApi.getMovieSearched(
        movieQury,
        "Bearer $apiKey",
      );
      final List<Movie> listMovies = response.results!;
      return ApiResult.success(listMovies);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
