import 'package:oktoast/oktoast.dart';

import 'package:fun/entity/course.dart';
import 'package:fun/entity/recommend_merchandise.dart';
import 'package:fun/model/base.dart';
import 'package:fun/service/course.dart';

///
/// 课程模型
///
/// @author zzzz1997
/// @created_time 20200331
///
class CourseModel extends BaseModel {
  // 课程列表
  List<Course> _courses = [];

  // 获取课程列表
  List<Course> get courses => _courses;

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
      _courses = await CourseService.getCourse();
      _merchandises = await CourseService.getRecommendMerchandise();
    });
  }

  ///
  /// 加载更多
  ///
  loadMore() async {
    await load(() async {
      var list = await CourseService.getRecommendMerchandise(page: _page + 1);
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
