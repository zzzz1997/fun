import 'package:flutter/material.dart';

import 'package:fun/widget/search_appbar.dart';

///
/// 分类页面
///
/// @author zzzz1997
/// @created_time 20200115
///
class ClassificationFragment extends StatefulWidget {
  @override
  _ClassificationFragmentState createState() => _ClassificationFragmentState();
}

///
/// 首页页面状态
///
class _ClassificationFragmentState extends State<ClassificationFragment>
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
