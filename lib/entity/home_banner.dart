import 'package:data_plugin/bmob/table/bmob_object.dart';
import 'package:data_plugin/bmob/type/bmob_file.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_banner.g.dart';

///
/// 主页轮播实体
///
/// @author zzzz1997
/// @created_time 20200323
///
@JsonSerializable()
class HomeBanner extends BmobObject {
  HomeBanner(this.image);

  // 图片
  BmobFile image;

  factory HomeBanner.fromJson(Map<String, dynamic> json) =>
      _$HomeBannerFromJson(json);

  Map<String, dynamic> toJson() => _$HomeBannerToJson(this);

  @override
  Map getParams() {
    return toJson();
  }
}
