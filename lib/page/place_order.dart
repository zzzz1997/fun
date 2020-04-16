import 'package:flutter/material.dart';

import 'package:fun/common/global.dart';

///
/// 下单页面
///
/// @author zzzz1997
/// @created_time 20200416
///
class PlaceOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
