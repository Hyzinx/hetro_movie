import 'package:hetro_anime/data/models/cast.dart';
import 'package:json_annotation/json_annotation.dart';

part 'credit.g.dart';

@JsonSerializable()
class Credit {
  int? id;
  List<Cast>? cast;

  Credit({this.id, this.cast});

  factory Credit.fromJson(Map<String, dynamic> json) => _$CreditFromJson(json);

  Map<String, dynamic> toJson() => _$CreditToJson(this);
}
