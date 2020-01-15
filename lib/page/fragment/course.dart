import 'package:flutter/material.dart';

import 'package:fun/widget/search_appbar.dart';

///
/// 课程页面
///
/// @author zzzz1997
/// @created_time 20200115
///
class CourseFragment extends StatefulWidget {
  @override
  _CourseFragmentState createState() => _CourseFragmentState();
}

///
/// 首页页面状态
///
class _CourseFragmentState extends State<CourseFragment>
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
