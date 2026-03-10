import 'package:dio/dio.dart';
import 'package:hetro_anime/consts/strings.dart';
import 'package:hetro_anime/data/models/review_response.dart';
import 'package:retrofit/retrofit.dart';

part 'review_api.g.dart';

@RestApi(baseUrl: baseUrlMovies)
abstract class ReviewApi {
  factory ReviewApi(Dio dio, {String? baseUrl}) = _ReviewApi;

  @GET('{id}/reviews')
  Future<ReviewResponse> getMovieReview(
    @Path() int id,
    @Header("Authorization") String authKey,
  );
}
