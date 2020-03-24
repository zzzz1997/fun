import 'package:flutter/material.dart';

import 'package:fun/entity/home_banner.dart';
import 'package:fun/service/home.dart';

///
/// 主页模型
///
/// @author zzzz1997
/// @created_time 20200323
///
class HomeModel extends ChangeNotifier {
  // 轮播列表
  List<HomeBanner> _banners = [];

  // 获取轮播列表
  List<HomeBanner> get banner => _banners;

  ///
  /// 初始化
  ///
  Future<void> init() async {
    _banners = await HomeService.getBanner();
  }
}
