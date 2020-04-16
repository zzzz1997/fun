import 'package:fun/entity/recommend_merchandise.dart';
import 'package:fun/service/base.dart';

///
/// 购物车服务
///
/// @author zzzz1997
/// @created_time 20200331
///
class ShoppingCartService {
  ///
  /// 获取推荐商品
  ///
  static Future<List<RecommendMerchandise>> getRecommendMerchandise(
      {int page = 1}) async {
    return (await BaseService.getList<RecommendMerchandise>(
      page: page,
      equal: {"type": 2},
    ))
        .map((i) => RecommendMerchandise.fromJson(i))
        .toList();
  }
}
