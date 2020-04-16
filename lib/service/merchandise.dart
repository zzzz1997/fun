import 'package:fun/entity/merchandise.dart';
import 'package:fun/service/base.dart';

///
/// 商品服务
///
/// @author zzzz1997
/// @created_time 20200416
///
class MerchandiseService {
  ///
  /// 获取推荐商品
  ///
  static Future<List<Merchandise>> getMerchandise({int page = 1}) async {
    return (await BaseService.getList<Merchandise>(page: page))
        .map((i) => Merchandise.fromJson(i))
        .toList();
  }
}
