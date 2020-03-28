// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommend_merchandise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendMerchandise _$RecommendMerchandiseFromJson(Map<String, dynamic> json) {
  return RecommendMerchandise(
      json['name'] as String,
      json['cover'] == null
          ? null
          : BmobFile.fromJson(json['cover'] as Map<String, dynamic>),
      (json['price'] as num)?.toDouble())
    ..createdAt = json['createdAt'] as String
    ..updatedAt = json['updatedAt'] as String
    ..objectId = json['objectId'] as String
    ..ACL = json['ACL'] as Map<String, dynamic>;
}

Map<String, dynamic> _$RecommendMerchandiseToJson(RecommendMerchandise instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'objectId': instance.objectId,
      'ACL': instance.ACL,
      'name': instance.name,
      'cover': instance.cover,
      'price': instance.price
    };
