// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hetro_anime/consts/strings.dart';
import 'package:hetro_anime/data/api/credit_api.dart';
import 'package:hetro_anime/data/exception_handeler/api_result.dart';
import 'package:hetro_anime/data/exception_handeler/network_exception.dart';
import 'package:hetro_anime/data/models/cast.dart';

class CreditRepository {
  final CreditApi creditApi;
  CreditRepository(this.creditApi);

  Future<ApiResult<List<Cast>>> getMovieCast(int movieId) async {
    try {
      final response = await creditApi.getMovieCast(movieId, "Bearer $apiKey");
      final List<Cast> casts = response.cast ??[];
      return ApiResult.success(casts);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
