import 'package:flutter/material.dart';

import 'package:fun/common/global.dart';
import 'package:fun/common/resource.dart';
import 'package:fun/page/fragment/recommend.dart';

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
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Global.brightnessColor(
            context, Colors.white, Theme.of(context).appBarTheme.color),
        elevation: 4,
        centerTitle: true,
        title: Text(
          '购物车',
          style: TextStyle(
            color: Theme.of(context).textTheme.body1.color,
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
      body: SingleChildScrollView(
        child: Column(
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
                          color: Global.brightnessColor(context,
                              Color(0xFF999999), IconTheme.of(context).color),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    color: Global.brightnessColor(
                                        context,
                                        Color(0xFF999999),
                                        IconTheme.of(context).color),
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
                              Color(0xFF999999),
                              Theme.of(context).textTheme.body1.color),
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
//            RecommendFragment([
//              Merchandise('苏绣团扇真丝宫扇手工刺绣扇中国风礼物送老外',
//                  'ic_merchandise_shopping_cart_0.jpg', 28.5),
//              Merchandise('苏绣成品纯手工荷花莲藕客厅书房装饰挂画',
//                  'ic_merchandise_shopping_cart_1.jpg', 28.5),
//              Merchandise('皮影手工艺品皮影人偶传统西安特色纪念品',
//                  'ic_merchandise_shopping_cart_2.jpg', 5799),
//              Merchandise('禅意阁天然竹子戒尺中国传统国学学生送老师创意',
//                  'ic_merchandise_shopping_cart_3.jpg', 5799),
//              Merchandise('东阳木雕挂件香樟木头雕刻画工艺品室内装饰品',
//                  'ic_merchandise_shopping_cart_4.jpg', 579),
//              Merchandise('脸谱漆器小屏风熊中国风特色礼品民间工艺品',
//                  'ic_merchandise_shopping_cart_5.jpg', 799),
//            ]),
          ],
        ),
      ),
    );
  }
}
