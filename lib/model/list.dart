import 'package:oktoast/oktoast.dart';

import 'package:fun/entity/merchandise.dart';
import 'package:fun/model/base.dart';
import 'package:fun/service/merchandise.dart';

///
/// 列表模型
///
/// @author zzzz1997
/// @created_time 20200416
///
class ListModel extends BaseModel {
  // 商品列表
  List<Merchandise> _merchandises = [];

  // 获取商品列表
  List<Merchandise> get merchandises => _merchandises;

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
      _merchandises = await MerchandiseService.getMerchandise();
    });
  }

  ///
  /// 加载更多
  ///
  loadMore() async {
    await load(() async {
      var list = await MerchandiseService.getMerchandise(page: _page + 1);
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
