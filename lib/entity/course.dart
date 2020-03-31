import 'package:data_plugin/bmob/table/bmob_object.dart';
import 'package:data_plugin/bmob/type/bmob_file.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course.g.dart';

///
/// 课程实体
///
/// @author zzzz1997
/// @created_time 20200331
///
@JsonSerializable()
class Course extends BmobObject {
  Course(this.name, this.cover);

  // 名称
  String name;

  // 图片
  BmobFile cover;

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);

  @override
  Map getParams() {
    return toJson();
  }
}
