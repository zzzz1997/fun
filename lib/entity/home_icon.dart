import 'package:data_plugin/bmob/table/bmob_object.dart';
import 'package:data_plugin/bmob/type/bmob_file.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_icon.g.dart';

///
/// 主页图标实体
///
/// @author zzzz1997
/// @created_time 20200323
///
@JsonSerializable()
class HomeIcon extends BmobObject {
  HomeIcon(this.icon, this.title);

  // 图标
  BmobFile icon;

  // 标题
  String title;

  factory HomeIcon.fromJson(Map<String, dynamic> json) =>
      _$HomeIconFromJson(json);

  Map<String, dynamic> toJson() => _$HomeIconToJson(this);

  @override
  Map getParams() {
    return toJson();
  }
}
