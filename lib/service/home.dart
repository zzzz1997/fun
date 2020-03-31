import 'package:fun/entity/home_banner.dart';
import 'package:fun/entity/home_icon.dart';
import 'package:fun/entity/recommend_merchandise.dart';
import 'package:fun/entity/recommend_work.dart';
import 'package:fun/service/base.dart';

///
/// 主页服务
///
/// @author zzzz1997
/// @created_time 20200323
///
class HomeService {
  ///
  /// 获取轮播
  ///
  static Future<List<HomeBanner>> getBanner() async {
    return (await BaseService.getList<HomeBanner>())
        .map((i) => HomeBanner.fromJson(i))
        .toList();
  }

  ///
  /// 获取图标
  ///
  static Future<List<HomeIcon>> getIcon() async {
    return (await BaseService.getList<HomeIcon>())
        .map((i) => HomeIcon.fromJson(i))
        .toList();
  }

  ///
  /// 获取工作
  ///
  static Future<List<RecommendWork>> getRecommendWork() async {
    return (await BaseService.getList<RecommendWork>())
        .map((i) => RecommendWork.fromJson(i))
        .toList();
  }

  ///
  /// 获取推荐商品
  ///
  static Future<List<RecommendMerchandise>> getRecommendMerchandise() async {
    return (await BaseService.getList<RecommendMerchandise>(equal: {"type": 0}))
        .map((i) => RecommendMerchandise.fromJson(i))
        .toList();
  }
}
