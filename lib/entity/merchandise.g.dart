// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchandise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Merchandise _$MerchandiseFromJson(Map<String, dynamic> json) {
  return Merchandise(
      json['name'] as String,
      json['cover'] == null
          ? null
          : BmobFile.fromJson(json['cover'] as Map<String, dynamic>),
      (json['price'] as num)?.toDouble(),
      json['tag'] as String,
      json['comment'] as int,
      json['rate'] as int)
    ..createdAt = json['createdAt'] as String
    ..updatedAt = json['updatedAt'] as String
    ..objectId = json['objectId'] as String
    ..ACL = json['ACL'] as Map<String, dynamic>;
}

Map<String, dynamic> _$MerchandiseToJson(Merchandise instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'objectId': instance.objectId,
      'ACL': instance.ACL,
      'name': instance.name,
      'cover': instance.cover,
      'price': instance.price,
      'tag': instance.tag,
      'comment': instance.comment,
      'rate': instance.rate
    };
