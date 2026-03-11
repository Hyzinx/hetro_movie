import 'package:hetro_anime/data/models/movie.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response_result.g.dart';

@JsonSerializable()
class ResponseResult {
  Map<String, dynamic>? dates;
  int? page;
  List<Movie>? results;
  int? totalPages;
  int? totalResults;

  ResponseResult({
    this.dates,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });
  factory ResponseResult.fromJson(Map<String, dynamic> json) => _$ResponseResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseResultToJson(this);
}
