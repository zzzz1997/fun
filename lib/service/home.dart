import 'package:data_plugin/bmob/bmob_query.dart';
import 'package:data_plugin/bmob/response/bmob_error.dart';

import 'package:fun/entity/home_banner.dart';
import 'package:fun/entity/home_icon.dart';

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
    try {
      var query = BmobQuery<HomeBanner>();
      var data = await query.queryObjects();
      return data.map((i) => HomeBanner.fromJson(i)).toList();
    } catch (e) {
      throw BmobError.convert(e);
    }
  }

  ///
  /// 获取图标
  ///
  static Future<List<HomeIcon>> getIcon() async {
    try {
      var query = BmobQuery<HomeIcon>();
      var data = await query.queryObjects();
      return data.map((i) => HomeIcon.fromJson(i)).toList();
    } catch (e) {
      throw BmobError.convert(e);
    }
  }
}
