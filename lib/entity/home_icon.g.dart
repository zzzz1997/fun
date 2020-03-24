// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_icon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeIcon _$HomeIconFromJson(Map<String, dynamic> json) {
  return HomeIcon(
      json['icon'] == null
          ? null
          : BmobFile.fromJson(json['icon'] as Map<String, dynamic>),
      json['title'] as String)
    ..createdAt = json['createdAt'] as String
    ..updatedAt = json['updatedAt'] as String
    ..objectId = json['objectId'] as String
    ..ACL = json['ACL'] as Map<String, dynamic>;
}

Map<String, dynamic> _$HomeIconToJson(HomeIcon instance) => <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'objectId': instance.objectId,
      'ACL': instance.ACL,
      'icon': instance.icon,
      'title': instance.title
    };
