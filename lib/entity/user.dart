import 'package:data_plugin/bmob/table/bmob_user.dart';
import 'package:data_plugin/bmob/type/bmob_file.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

///
/// 推荐工作实体
///
/// @author zzzz1997
/// @created_time 20200331
///
@JsonSerializable()
class User extends BmobUser {
  User(this.avatar, this.credit, this.vip, this.footprint, this.course,
      this.merchandise, this.treasury);

  factory User.empty() => User(BmobFile(), 0, '', 0, 0, 0, 0);

  // 头像
  BmobFile avatar;

  // 信用
  double credit;

  // 会员
  String vip;

  // 足迹
  int footprint;

  // 课程
  int course;

  // 商品
  int merchandise;

  // 小金库
  double treasury;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  Map getParams() {
    return toJson();
  }
}
