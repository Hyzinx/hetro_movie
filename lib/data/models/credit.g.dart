// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Credit _$CreditFromJson(Map<String, dynamic> json) => Credit(
  id: (json['id'] as num?)?.toInt(),
  cast: (json['cast'] as List<dynamic>?)
      ?.map((e) => Cast.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CreditToJson(Credit instance) => <String, dynamic>{
  'id': instance.id,
  'cast': instance.cast,
};
