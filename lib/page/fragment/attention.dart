import 'package:flutter/material.dart';

///
/// 关注页面
///
/// @author zzzz1997
/// @created_time 20191122
///
class AttentionFragment extends StatefulWidget {
  @override
  _AttentionFragmentState createState() => _AttentionFragmentState();
}

///
/// 关注页面状态
///
class _AttentionFragmentState extends State<AttentionFragment>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text('hhh'),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, i) => Container(
              height: 50,
              margin: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 5,
              ),
              color: Colors.blueAccent,
            ),
            childCount: 100,
          ),
        ),
      ],
    );
  }
}
