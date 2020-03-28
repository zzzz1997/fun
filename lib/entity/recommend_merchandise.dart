import 'package:data_plugin/bmob/table/bmob_object.dart';
import 'package:data_plugin/bmob/type/bmob_file.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recommend_merchandise.g.dart';

///
/// 商品实体
///
/// @author zzzz1997
/// @created_time 20200323
///
@JsonSerializable()
class RecommendMerchandise extends BmobObject {
  RecommendMerchandise(this.name, this.cover, this.price);

  // 名称
  String name;

  // 图片
  BmobFile cover;

  // 价格
  double price;

  factory RecommendMerchandise.fromJson(Map<String, dynamic> json) =>
      _$RecommendMerchandiseFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendMerchandiseToJson(this);

  @override
  Map getParams() {
    return toJson();
  }
}
