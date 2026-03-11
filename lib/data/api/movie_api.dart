import 'package:dio/dio.dart';
import 'package:hetro_anime/consts/strings.dart';
import 'package:hetro_anime/data/models/movie.dart';
import 'package:hetro_anime/data/models/response_result.dart';
import 'package:retrofit/retrofit.dart';

part 'movie_api.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class MovieApi {
  factory MovieApi(Dio dio, {String? baseUrl}) = _MovieApi;

  @GET('movie/now_playing')
  Future<ResponseResult> getMoviesPlayNow(
    @Header("Authorization") String authKey,
  );
  @GET('movie/upcoming')
  Future<ResponseResult> getMoviesUpcoming(
    @Header("Authorization") String authKey,
  );
  @GET('movie/top_rated')
  Future<ResponseResult> getMoviesTopRated(
    @Header("Authorization") String authKey,
  );
  @GET('movie/popular')
  Future<ResponseResult> getMoviesPopular(
    @Header("Authorization") String authKey,
  );

  @GET('movie/{id}')
  Future<Movie> getMovieById(
    @Path() int id,
    @Header("Authorization") String authKey,
  );
  @GET('search/movie')
  Future<ResponseResult> getMovieSearched(
    @Query('query') String movieQury,
    @Header("Authorization") String authKey,
  );
}
