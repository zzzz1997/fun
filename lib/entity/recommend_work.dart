import 'package:data_plugin/bmob/table/bmob_object.dart';
import 'package:data_plugin/bmob/type/bmob_file.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recommend_work.g.dart';

///
/// 推荐工作实体
///
/// @author zzzz1997
/// @created_time 20200331
///
@JsonSerializable()
class RecommendWork extends BmobObject {
  RecommendWork(this.name, this.image);

  // 名称
  String name;

  // 图片
  BmobFile image;

  factory RecommendWork.fromJson(Map<String, dynamic> json) =>
      _$RecommendWorkFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendWorkToJson(this);

  @override
  Map getParams() {
    return toJson();
  }
}
