import 'package:data_plugin/bmob/table/bmob_object.dart';
import 'package:data_plugin/bmob/type/bmob_file.dart';
import 'package:json_annotation/json_annotation.dart';

part 'merchandise.g.dart';

///
/// 商品实体
///
/// @author zzzz1997
/// @created_time 20200323
///
@JsonSerializable()
class Merchandise extends BmobObject {
  Merchandise(this.name, this.cover, this.price);

  // 名称
  String name;

  // 图片
  BmobFile cover;

  // 价格
  double price;

  factory Merchandise.fromJson(Map<String, dynamic> json) =>
      _$MerchandiseFromJson(json);

  Map<String, dynamic> toJson() => _$MerchandiseToJson(this);

  @override
  Map getParams() {
    return toJson();
  }
}
