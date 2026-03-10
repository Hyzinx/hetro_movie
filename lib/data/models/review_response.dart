import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hetro_anime/data/models/review.dart';

part 'review_response.g.dart';

@JsonSerializable()
class ReviewResponse {
  int? id;
  int? page;
  List<Review>? results;
  @JsonKey(name: "total_pages")
  int? totalPages;
  @JsonKey(name: "total_results")
  int? totalResults;

  ReviewResponse({
    this.id,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });
  factory ReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewResponseToJson(this);
}
