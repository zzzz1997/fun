import 'package:flutter/material.dart';
import 'package:fun/common/route.dart';

import 'package:provider/provider.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:oktoast/oktoast.dart';

import 'package:fun/common/global.dart';
import 'package:fun/common/resource.dart';
import 'package:fun/model/shopping_cart.dart';
import 'package:fun/page/fragment/recommend.dart';
import 'package:fun/widget/loading_view.dart';

///
/// 关注页面
///
/// @author zzzz1997
/// @created_time 20191122
///
class ShoppingCartFragment extends StatefulWidget {
  @override
  _ShoppingCartFragmentState createState() => _ShoppingCartFragmentState();
}

///
/// 关注页面状态
///
class _ShoppingCartFragmentState extends State<ShoppingCartFragment>
    with AutomaticKeepAliveClientMixin {
  // 刷新键
  final _controller = EasyRefreshController();

  // 状态模型
  final _model = ShoppingCartModel();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadData(true);
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Global.brightnessColor(context,
            light: Colors.white, dark: Theme.of(context).canvasColor),
        elevation: 4,
        centerTitle: true,
        title: Text(
          '购物车',
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyText1.color,
            fontWeight: FontWeight.normal,
          ),
        ),
        actions: <Widget>[
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                right: 16,
              ),
              child: Text(
                '编辑',
                style: TextStyle(
                  color: Theme.of(context).textTheme.button.color,
                ),
              ),
            ),
          ),
        ],
      ),
      body: ChangeNotifierProvider.value(
        value: _model,
        child: Consumer<ShoppingCartModel>(
          builder: (_, m, __) => LoadingView(
            commonStatus: _model.status,
            isEmpty: _model.merchandises.isEmpty,
            child: EasyRefresh.custom(
              controller: _controller,
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
                    (_, i) => i == 0
                        ? Column(
                            children: <Widget>[
                              SizedBox(
                                height: 10,
                              ),
                              Card(
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: 40,
                                          child: Center(
                                            child: Icon(
                                              Icons.check_circle,
                                              color: Style.colorRed,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            'ZJ民间艺',
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Icon(
                                            Icons.error,
                                            color: Global.brightnessColor(
                                                context,
                                                light: Color(0xFF999999),
                                                dark: IconTheme.of(context)
                                                    .color),
                                            size: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: 40,
                                          child: Center(
                                            child: Text(
                                              '满减',
                                              style: TextStyle(
                                                color: Style.colorRed,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            '已购满19.00元，可领取赠品',
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '领赠品',
                                          style: TextStyle(
                                            color: Style.colorRed,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(
                                            Icons.chevron_right,
                                            color: Style.colorRed,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: 40,
                                          child: Center(
                                            child: Icon(
                                              Icons.check_circle,
                                              color: Style.colorRed,
                                            ),
                                          ),
                                        ),
                                        ImageHelper.assetImage(
                                          'ic_merchandise_shopping_cart.jpg',
                                          width: 95,
                                          height: 95,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: SizedBox(
                                            height: 95,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  '潮州传统工艺品纯手工花茉莉陶瓷花白色禅意摆件摆设香插线香香座',
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      child: Text(
                                                        '￥28.50',
                                                        style: TextStyle(
                                                          color: Style.colorRed,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.remove,
                                                      color: Global
                                                          .brightnessColor(
                                                              context,
                                                              light: Color(
                                                                  0xFF999999),
                                                              dark: IconTheme.of(
                                                                      context)
                                                                  .color),
                                                      size: 20,
                                                    ),
                                                    SizedBox(
                                                      width: 20,
                                                      child: Center(
                                                        child: Text(
                                                          '1',
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.add,
                                                      size: 20,
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: 40,
                                        ),
                                        Text(
                                          '优惠',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          '满100.00、105.00、110.00可换购商品',
                                          style: TextStyle(
                                            color: Global.brightnessColor(
                                                context,
                                                light: Color(0xFF999999),
                                                dark: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    .color),
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : RecommendFragment(_model.merchandises),
                    childCount: 2,
                  ),
                )
              ],
            ),
            onErrorTap: () {
              _loadData(true);
            },
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.check_circle,
              color: Style.colorRed,
            ),
            SizedBox(
              width: 10,
            ),
            Text('全选'),
            SizedBox(
              width: 15,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '合计：￥28.50',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  '￥28.50',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                MyRoute.pushNamed(MyRoute.place_order);
              },
              child: DecoratedBox(
                decoration: ShapeDecoration(
                  shape: StadiumBorder(),
                  color: Style.colorRed,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 3,
                  ),
                  child: Text(
                    '结算',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
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
