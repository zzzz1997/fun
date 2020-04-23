import 'package:data_plugin/bmob/bmob_query.dart';

import 'package:fun/entity/recommend_merchandise.dart';
import 'package:fun/entity/user.dart';
import 'package:fun/service/base.dart';

///
/// 用户服务
///
/// @author zzzz1997
/// @created_time 20200423
///
class UserService {
  ///
  /// 获取课程
  ///
  static Future<User> getUser() async {
    var query = BmobQuery<User>();
    return User.fromJson(await query.queryUser("MiZfcccq"));
  }

  ///
  /// 获取推荐商品
  ///
  static Future<List<RecommendMerchandise>> getRecommendMerchandise(
      {int page = 1}) async {
    return (await BaseService.getList<RecommendMerchandise>(
      page: page,
      equal: {"type": 3},
    ))
        .map((i) => RecommendMerchandise.fromJson(i))
        .toList();
  }
}
