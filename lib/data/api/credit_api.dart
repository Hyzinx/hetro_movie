import 'package:dio/dio.dart';
import 'package:hetro_anime/consts/strings.dart';
import 'package:hetro_anime/data/models/credit.dart';
import 'package:retrofit/retrofit.dart';

part 'credit_api.g.dart';

@RestApi(baseUrl: baseUrlMovies)
abstract class CreditApi {
  factory CreditApi(Dio dio, {String? baseUrl}) = _CreditApi;

  @GET('{id}/credits')
  Future<Credit> getMovieCast(
    @Path() int id,
    @Header("Authorization") String authKey,
  );
}
