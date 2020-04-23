import 'package:flutter/material.dart';

import 'package:fun/common/global.dart';
import 'package:fun/common/resource.dart';

///
/// 下单页面
///
/// @author zzzz1997
/// @created_time 20200416
///
class PlaceOrderPage extends StatefulWidget {
  @override
  _PlaceOrderPageState createState() => _PlaceOrderPageState();
}

///
/// 下单页面状态
///
class _PlaceOrderPageState extends State<PlaceOrderPage> {
  // 选择
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Global.brightnessColor(context,
          light: Color(0xFFF0F0F0), dark: Theme.of(context).canvasColor),
      appBar: AppBar(
        backgroundColor: Global.brightnessColor(context,
            light: Colors.white, dark: Theme.of(context).canvasColor),
        elevation: 4,
        centerTitle: true,
        leading: BackButton(
          color: Global.brightnessColor(context),
        ),
        title: Text(
          '填写订单',
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyText1.color,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              margin: EdgeInsets.zero,
              shape: Border(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 34,
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: <InlineSpan>[
                                      TextSpan(
                                        text: '陈胜    186****2380 ',
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '默认',
                                        style: TextStyle(
                                          color: Style.colorRed,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.location_on,
                                  color: Style.iconGrey,
                                  size: 14,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '广东 深圳 宝安区 详细地址......',
                                  style: TextStyle(
                                    fontSize: 13,
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
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: Style.iconGrey,
                        size: 32,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  _buildDashed(),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              margin: EdgeInsets.zero,
              shape: Border(),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        ImageHelper.assetImage(
                          'ic_merchandise_shopping_cart.jpg',
                          width: 75,
                          height: 75,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '潮州传统工艺品纯手工花茉莉陶瓷花白色禅意摆件摆设香插线香香座',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                '颜色：白色',
                                style: TextStyle(
                                  color: Global.brightnessColor(context,
                                      light: Colors.grey),
                                  fontSize: 11,
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    '￥28.50',
                                    style: TextStyle(
                                      color: Style.colorRed,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '0.470kg×1',
                                    style: TextStyle(
                                      color: Global.brightnessColor(context,
                                          light: Colors.grey),
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '支持七天无理由退货',
                                style: TextStyle(
                                  color: Style.colorBlue,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 1,
                    color: Style.dividerGrey,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        _buildTile('支付配送', '在线支付\n韵达快递'),
                        Text.rich(
                          TextSpan(
                            children: <InlineSpan>[
                              WidgetSpan(
                                child: Icon(
                                  Icons.access_time,
                                  color: Style.colorRed,
                                  size: 14,
                                ),
                              ),
                              TextSpan(
                                text: '5月6日',
                              ),
                              TextSpan(
                                text: ' [周六] ',
                                style: TextStyle(
                                  color: Style.colorRed,
                                ),
                              ),
                              TextSpan(
                                text: '09:00-19:00',
                              ),
                            ],
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              margin: EdgeInsets.zero,
              shape: Border(),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildTile('发票', '明细(纸质)-个人'),
                    Row(
                      children: <Widget>[
                        Text(
                          '退换无忧',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '￥0.50',
                          style: TextStyle(
                            color: Style.colorRed,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Switch(
                          value: _checked,
                          onChanged: (b) {
                            _checked = b;
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Text(
                      '7天内退货，15天内换货，可享1次上门取件服务。',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              margin: EdgeInsets.zero,
              shape: Border(),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    _buildTile('优惠券', '无可用'),
                    _buildTile('大王卡/E卡', '无可用'),
                    Row(
                      children: <Widget>[
                        Text(
                          '艺豆  共500艺豆，满1000艺豆可用',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        Icon(
                          Icons.error,
                          color: Style.iconGrey,
                          size: 14,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              margin: EdgeInsets.zero,
              shape: Border(),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          '商品金额',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '￥28.50',
                          style: TextStyle(
                            color: Style.colorRed,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          '运费',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          '(总重:0.87kg)',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '+￥0.00',
                          style: TextStyle(
                            color: Style.colorRed,
                            fontSize: 15,
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
      ),
      bottomNavigationBar: Material(
        elevation: 8,
        color: Global.brightnessColor(
          context,
          light: Colors.white,
          dark: Theme.of(context).cardColor,
        ),
        child: SizedBox(
          width: Global.mediaQuery.size.width,
          height: 50,
          child: Center(
            child: Text(
              '实付款:￥28.50',
              style: TextStyle(
                color: Style.colorRed,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }

  ///
  /// 构建虚线
  ///
  Widget _buildDashed() {
    var length = 12;
    var colors = [Color(0xFF188FC9), Color(0xFFE9803E), Color(0xFFE55A7E)];
    double d = Global.mediaQuery.size.width;
    double width = d * 2 / length / 3;
    var widgets = List<Widget>(length * 2 + 1);
    for (var i = 0; i < widgets.length; i++) {
      widgets[i] = i.isEven
          ? Container(
              width: i == 0 || i == widgets.length - 1 ? width / 2 : width,
              height: 2,
              color: colors[i ~/ 2 % 3],
            )
          : SizedBox(
              width: width / 2,
            );
    }
    return Row(
      children: widgets,
    );
  }

  ///
  /// 构建磁贴
  ///
  Widget _buildTile(String title, String content) {
    return Row(
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        Spacer(),
        Text(
          content,
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.keyboard_arrow_right,
          color: Style.iconGrey,
          size: 32,
        ),
      ],
    );
  }
}
