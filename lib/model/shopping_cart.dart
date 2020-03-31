import 'package:oktoast/oktoast.dart';

import 'package:fun/entity/recommend_merchandise.dart';
import 'package:fun/model/base.dart';
import 'package:fun/service/shopping_cart.dart';

///
/// 购物车模型
///
/// @author zzzz1997
/// @created_time 20200331
///
class ShoppingCartModel extends BaseModel {
  // 商品列表
  List<RecommendMerchandise> _merchandises = [];

  // 获取商品列表
  List<RecommendMerchandise> get merchandises => _merchandises;

  // 没有更多
  bool _noMore = false;

  // 获取没有更多
  bool get noMore => _noMore;

  ///
  /// 初始化
  ///
  init() async {
    await load(() async {
      _merchandises = await ShoppingCartService.getRecommendMerchandise();
    });
  }

  ///
  /// 加载更多
  ///
  loadMore() async {
    await load(() async {
      await Future.delayed(Duration(seconds: 1));
      _noMore = true;
      showToast('没有更多了～');
    });
  }
}
