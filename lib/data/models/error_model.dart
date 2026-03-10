import 'package:json_annotation/json_annotation.dart';

part 'error_model.g.dart';

@JsonSerializable()
class ErrorModel {
  bool? success;
  @JsonKey(name: "status_code")
  int? statusCode;
  @JsonKey(name: "status_message")
  String? statusMessage;

  ErrorModel({this.success, this.statusCode, this.statusMessage});

  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorModelToJson(this);
}
