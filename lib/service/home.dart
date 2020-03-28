import 'package:fun/entity/home_banner.dart';
import 'package:fun/entity/home_icon.dart';
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
}
