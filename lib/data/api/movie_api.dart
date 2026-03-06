import 'package:dio/dio.dart';
import 'package:hetro_anime/consts/strings.dart';
import 'package:hetro_anime/data/models/response_result.dart';
import 'package:retrofit/retrofit.dart';

part '../generators/api_generator/movie_api.g.dart';

@RestApi(baseUrl: baseUrlMovies)
abstract class MovieApi {
  factory MovieApi(Dio dio, {String? baseUrl}) = _MovieApi;

  @GET('now_playing')
  Future<ResponseResult> getMoviesPlayNow();
}
