import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hetro_anime/data/models/author_details.dart';

part 'review.g.dart';

@JsonSerializable()
class Review {
  String? author;
  @JsonKey(name: "author_details")
  AuthorDetails? authorDetails;
  String? content;
  @JsonKey(name: "created_at")
  String? createdAt;
  String? id;
  @JsonKey(name: "updated_at")
  String? updatedAt;
  String? url;

  Review({
    this.author,
    this.authorDetails,
    this.content,
    this.createdAt,
    this.id,
    this.updatedAt,
    this.url,
  });
    factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}
