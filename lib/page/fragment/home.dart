import 'package:flutter/material.dart';

import 'package:fun/widget/search_appbar.dart';

///
/// 首页页面
///
/// @author zzzz1997
/// @created_time 20200114
///
class HomeFragment extends StatefulWidget {
  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

///
/// 首页页面状态
///
class _HomeFragmentState extends State<HomeFragment>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: SearchAppBar(),
      body: Column(
        children: <Widget>[

        ],
      ),
    );
  }
}
