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
    return (await BaseService.getList<HomeBanner>(all: true))
        .map((i) => HomeBanner.fromJson(i))
        .toList();
  }

  ///
  /// 获取图标
  ///
  static Future<List<HomeIcon>> getIcon() async {
    return (await BaseService.getList<HomeIcon>(all: true))
        .map((i) => HomeIcon.fromJson(i))
        .toList();
  }

  ///
  /// 获取工作
  ///
  static Future<List<RecommendWork>> getRecommendWork() async {
    return (await BaseService.getList<RecommendWork>(all: true))
        .map((i) => RecommendWork.fromJson(i))
        .toList();
  }

  ///
  /// 获取推荐商品
  ///
  static Future<List<RecommendMerchandise>> getRecommendMerchandise(
      {int page = 1}) async {
    return (await BaseService.getList<RecommendMerchandise>(
      page: page,
      equal: {"type": 0},
    ))
        .map((i) => RecommendMerchandise.fromJson(i))
        .toList();
  }
}
