// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommend_work.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendWork _$RecommendWorkFromJson(Map<String, dynamic> json) {
  return RecommendWork(
      json['name'] as String,
      json['image'] == null
          ? null
          : BmobFile.fromJson(json['image'] as Map<String, dynamic>))
    ..createdAt = json['createdAt'] as String
    ..updatedAt = json['updatedAt'] as String
    ..objectId = json['objectId'] as String
    ..ACL = json['ACL'] as Map<String, dynamic>;
}

Map<String, dynamic> _$RecommendWorkToJson(RecommendWork instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'objectId': instance.objectId,
      'ACL': instance.ACL,
      'name': instance.name,
      'image': instance.image
    };
