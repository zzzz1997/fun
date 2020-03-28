import 'package:fun/entity/home_banner.dart';
import 'package:fun/entity/home_icon.dart';
import 'package:fun/model/base.dart';
import 'package:fun/service/home.dart';

///
/// 主页模型
///
/// @author zzzz1997
/// @created_time 20200323
///
class HomeModel extends BaseModel {
  // 轮播列表
  List<HomeBanner> _banners = [];

  // 获取轮播列表
  List<HomeBanner> get banners => _banners;

  // 图标列表
  List<HomeIcon> _icons = [];

  // 获取图标列表
  List<HomeIcon> get icons => _icons;

  ///
  /// 初始化
  ///
  init() async {
    load(() async {
      _banners = await HomeService.getBanner();
      _icons = await HomeService.getIcon();
    }, loading: _banners.isEmpty);
  }
}
