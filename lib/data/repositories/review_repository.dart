// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hetro_anime/consts/strings.dart';
import 'package:hetro_anime/data/api/review_api.dart';
import 'package:hetro_anime/data/exception_handeler/api_result.dart';
import 'package:hetro_anime/data/exception_handeler/network_exception.dart';
import 'package:hetro_anime/data/models/author_details.dart';
import 'package:hetro_anime/data/models/review.dart';

class ReviewRepository {
  final ReviewApi reviewApi;
  ReviewRepository(this.reviewApi);

  Future<ApiResult<List<Review>>> getMovieReview(int movieId) async {
    try {
      final response = await reviewApi.getMovieReview(
        movieId,
        "Bearer $apiKey",
      );

      final List<Review> revies = response.results ?? [];
      return ApiResult.success(revies);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
