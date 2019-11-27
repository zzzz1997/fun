import 'dart:math';

import 'package:flutter/material.dart';

import 'package:oktoast/oktoast.dart';

import 'package:fun/common/global.dart';
import 'package:fun/model/theme.dart';

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
    final iconColor = Global.theme.accentColor;
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text('用户'),
          expandedHeight: 200.0,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              'assets/images/bg_user_fun.jpg',
              fit: BoxFit.cover,
            ),
          ),
          pinned: true,
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            <Widget>[
              ListTile(
                title: Text(Global.s.darkMode),
                onTap: switchDarkMode,
                leading: Transform.rotate(
                  angle: -pi,
                  child: Icon(
                    Global.theme.brightness == Brightness.light
                        ? Icons.brightness_5
                        : Icons.brightness_2,
                    color: iconColor,
                  ),
                ),
                trailing: Switch(
                    activeColor: Global.theme.accentColor,
                    value: Global.theme.brightness == Brightness.dark,
                    onChanged: (_) {
                      switchDarkMode();
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }

  ///
  /// 切换夜间模式
  ///
  switchDarkMode() {
    if (Global.mediaQuery.platformBrightness == Brightness.dark) {
      showToast(
        '检测到系统为暗黑模式,已为你自动切换',
        position: ToastPosition.bottom,
      );
    } else {
      Global.model<ThemeModel>().switchTheme(
        isDarkMode: Global.theme.brightness == Brightness.light,
      );
    }
  }
}
