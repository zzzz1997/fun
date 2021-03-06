import 'package:fun/entity/course.dart';
import 'package:fun/entity/recommend_merchandise.dart';
import 'package:fun/service/base.dart';

///
/// 课程服务
///
/// @author zzzz1997
/// @created_time 20200331
///
class CourseService {
  ///
  /// 获取课程
  ///
  static Future<List<Course>> getCourse() async {
    return (await BaseService.getList<Course>(all: true))
        .map((i) => Course.fromJson(i))
        .toList();
  }

  ///
  /// 获取推荐商品
  ///
  static Future<List<RecommendMerchandise>> getRecommendMerchandise(
      {int page = 1}) async {
    return (await BaseService.getList<RecommendMerchandise>(
      page: page,
      equal: {"type": 1},
    ))
        .map((i) => RecommendMerchandise.fromJson(i))
        .toList();
  }
}
