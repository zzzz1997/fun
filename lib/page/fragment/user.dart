import 'package:flutter/material.dart';

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
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text('用户'),
          expandedHeight: 200.0,
          flexibleSpace: FlexibleSpaceBar(
//            background: Image.asset('images/food01.jpeg', fit: BoxFit.cover),
              ),
          pinned: true,
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            <Widget>[
//              ListTile(
//                title: Text(S.of(context).darkMode),
//                onTap: () {
//                  switchDarkMode(context);
//                },
//                leading: Transform.rotate(
//                  angle: -pi,
//                  child: Icon(
//                    Theme.of(context).brightness == Brightness.light
//                        ? Icons.brightness_5
//                        : Icons.brightness_2,
//                    color: iconColor,
//                  ),
//                ),
//                trailing: CupertinoSwitch(
//                    activeColor: Theme.of(context).accentColor,
//                    value: Theme.of(context).brightness == Brightness.dark,
//                    onChanged: (value) {
//                      switchDarkMode(context);
//                    }),
//              ),
            ],
          ),
        ),
      ],
    );
  }
}
