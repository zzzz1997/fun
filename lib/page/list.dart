import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:oktoast/oktoast.dart';

import 'package:fun/common/global.dart';
import 'package:fun/common/resource.dart';
import 'package:fun/entity/merchandise.dart';
import 'package:fun/model/list.dart';
import 'package:fun/widget/loading_view.dart';
import 'package:fun/widget/search_appbar.dart';

///
/// 商品列表页面
///
/// @author zzzz1997
/// @created_time 20200416
///
class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

///
/// 商品列表页面状态
///
class _ListPageState extends State<ListPage> {
  // 状态模型
  final _model = ListModel();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadData(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _model,
      child: Scaffold(
        appBar: SearchAppBar(
          left: Icon(
            Icons.arrow_back,
            color: Style.iconGrey,
          ),
          right: Icon(
            Icons.category,
            color: Style.iconGrey,
          ),
          bottom: PreferredSize(
            child: Row(
              children: <Widget>[
                _buildTab('综合'),
                _buildTab('销量', selected: true),
                _buildTab('价格'),
                _buildTab('筛选'),
              ],
            ),
            preferredSize: Size(double.infinity, 40),
          ),
          onLeftTap: () {
            Global.navigator.pop();
          },
        ),
        body: Consumer<ListModel>(
          builder: (_, m, __) => LoadingView(
            commonStatus: _model.status,
            isEmpty: _model.merchandises.isEmpty,
            child: EasyRefresh.custom(
              footer: MaterialFooter(enableInfiniteLoad: !_model.noMore),
              onRefresh: () async {
                await _loadData(true);
              },
              onLoad: () async {
                await _loadData(false);
              },
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (_, i) => i.isEven
                        ? _buildMerchandise(_model.merchandises[i ~/ 2])
                        : Container(
                            height: 1,
                            color: Style.dividerGrey,
                          ),
                    childCount: 2 * _model.merchandises.length - 1,
                  ),
                ),
              ],
            ),
            onErrorTap: () {
              _loadData(true);
            },
          ),
        ),
      ),
    );
  }

  ///
  /// 构建标签
  ///
  Widget _buildTab(tab, {bool selected = false}) {
    return Expanded(
      child: Center(
        child: Text(
          tab,
          style: TextStyle(
            color: selected ? Style.colorRed : Global.brightnessColor(context),
          ),
        ),
      ),
    );
  }

  ///
  /// 构建商品
  ///
  Widget _buildMerchandise(Merchandise merchandise) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: Row(
        children: <Widget>[
          ImageHelper.networkImage(
            merchandise.cover.url,
            width: 115,
            height: 115,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: SizedBox(
              height: 115,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    merchandise.name,
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '￥${merchandise.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Style.colorRed,
                      fontSize: 18,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      if (merchandise.tag != null)
                        Text(
                          merchandise.tag,
                          style: TextStyle(
                            color: Style.colorRed,
                            fontSize: 10,
                          ),
                        ),
                      if (merchandise.tag != null)
                        SizedBox(
                          width: 10,
                        ),
                      Text(
                        '${merchandise.comment}条评论    ${merchandise.rate}%好评',
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///
  /// 加载数据
  ///
  _loadData(bool isRefresh) async {
    try {
      if (isRefresh) {
        await _model.init();
      } else {
        await _model.loadMore();
      }
    } catch (e) {
      showToast(e.toString());
    }
  }
}
