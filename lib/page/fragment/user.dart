import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:oktoast/oktoast.dart';

import 'package:fun/common/global.dart';
import 'package:fun/common/resource.dart';
import 'package:fun/common/route.dart';
import 'package:fun/model/user.dart';
import 'package:fun/page/fragment/recommend.dart';
import 'package:fun/widget/loading_view.dart';

///
/// 用户页面
///
/// @author zzzz1997
/// @created_time 20191122
///
class UserFragment extends StatefulWidget {
  @override
  _UserFragmentState createState() => _UserFragmentState();
}

///
/// 用户界面状态
///
class _UserFragmentState extends State<UserFragment>
    with AutomaticKeepAliveClientMixin {
  // 状态模型
  final _model = UserModel();

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
      body: ChangeNotifierProvider.value(
        value: _model,
        child: Consumer<UserModel>(
          builder: (_, m, __) => LoadingView(
            commonStatus: _model.status,
            isEmpty: _model.user == null,
            child: EasyRefresh.custom(
              footer: MaterialFooter(enableInfiniteLoad: !_model.noMore),
              onRefresh: () async {
                await _loadData(true);
              },
              onLoad: () async {
                await _loadData(false);
              },
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Container(
                    color: Global.brightnessColor(
                      context,
                      light: Color(0xFFF05C3A),
                      dark: Theme.of(context).primaryColor,
                    ),
                    height: 134 + Global.mediaQuery.padding.top,
                    padding: EdgeInsets.only(
                      top: Global.mediaQuery.padding.top,
                    ),
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: <Widget>[
                        DefaultTextStyle(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 15,
                              ),
                              ImageHelper.networkImage(
                                _model.user.avatar?.url ?? '',
                                width: 60,
                                height: 60,
                                shape: BoxShape.circle,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    _model.user.username ?? '',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: SizedBox(
                                          width: 64,
                                          child: LinearProgressIndicator(
                                            value: _model.user.credit / 100,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '${_model.user.credit.toStringAsFixed(1)}信用分',
                                        style: TextStyle(
                                          fontSize: 9,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    _model.user.vip,
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: IconButton(
                              icon: Icon(
                                Icons.settings,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                MyRoute.pushNamed(
                                  MyRoute.setting,
                                  routeType: AnimationType.CUPERTINO,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          _buildItem('待付款', icon: Icons.credit_card),
                          _buildItem('待收货', icon: Icons.local_shipping),
                          _buildItem('待评价', icon: Icons.info),
                          _buildItem('退货/售后', icon: Icons.verified_user),
                          Container(
                            width: 1,
                            height: 40,
                            color: Style.dividerGrey,
                            margin: EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                          ),
                          _buildItem('退货/售后', icon: Icons.shopping_cart),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 1,
                        color: Style.dividerGrey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          _buildItem('足迹',
                              value: _model.user.footprint.toString()),
                          _buildItem('收藏课程',
                              value: _model.user.course.toString()),
                          _buildItem('收藏商品',
                              value: _model.user.merchandise.toString()),
                          _buildItem('小金库',
                              value: _model.user.treasury.toStringAsFixed(2)),
                          Container(
                            width: 1,
                            height: 40,
                            color: Style.dividerGrey,
                            margin: EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                          ),
                          _buildItem('我的钱包',
                              icon: Icons.account_balance_wallet,
                              iconColor: Style.colorRed),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 1,
                        color: Style.dividerGrey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          '等 / 你 / 体 / 验',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Center(
                              child: Text(
                                '文化之旅',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                '课程体验',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RecommendFragment(_model.merchandises),
                    ],
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
  /// 构建单元
  ///
  Widget _buildItem(String title,
      {IconData icon, String value, Color iconColor}) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (icon != null)
            Icon(
              icon,
              size: 24,
              color: iconColor ?? Global.brightnessColor(context),
            ),
          if (value != null)
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
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
