import 'package:oktoast/oktoast.dart';

import 'package:fun/entity/user.dart';
import 'package:fun/entity/recommend_merchandise.dart';
import 'package:fun/model/base.dart';
import 'package:fun/service/user.dart';

///
/// 用户模型
///
/// @author zzzz1997
/// @created_time 20200423
///
class UserModel extends BaseModel {
  // 用户信息
  User _user = User.empty();

  // 获取用户信息
  User get user => _user;

  // 商品列表
  List<RecommendMerchandise> _merchandises = [];

  // 获取商品列表
  List<RecommendMerchandise> get merchandises => _merchandises;

  // 页码
  int _page = 1;

  // 没有更多
  bool _noMore = false;

  // 获取没有更多
  bool get noMore => _noMore;

  ///
  /// 初始化
  ///
  init() async {
    _page = 1;
    _noMore = false;
    await load(() async {
      _user = await UserService.getUser();
      _merchandises = await UserService.getRecommendMerchandise();
    });
  }

  ///
  /// 加载更多
  ///
  loadMore() async {
    await load(() async {
      var list = await UserService.getRecommendMerchandise(page: _page + 1);
      if (list.isNotEmpty) {
        _page++;
        _merchandises += list;
      } else {
        _noMore = true;
        showToast('没有更多了～');
      }
    });
  }
}
