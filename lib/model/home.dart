import 'package:oktoast/oktoast.dart';

import 'package:fun/entity/home_banner.dart';
import 'package:fun/entity/home_icon.dart';
import 'package:fun/entity/recommend_merchandise.dart';
import 'package:fun/entity/recommend_work.dart';
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

  // 工作列表
  List<RecommendWork> _works = [];

  // 获取工作列表
  List<RecommendWork> get works => _works;

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
      _banners = await HomeService.getBanner();
      _icons = await HomeService.getIcon();
      _works = await HomeService.getRecommendWork();
      _merchandises = await HomeService.getRecommendMerchandise();
    });
  }

  ///
  /// 加载更多
  ///
  loadMore() async {
    await load(() async {
      var list = await HomeService.getRecommendMerchandise(page: _page + 1);
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
