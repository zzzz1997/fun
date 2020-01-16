import 'dart:math';

import 'package:flutter/material.dart';

import 'package:oktoast/oktoast.dart';

import 'package:fun/common/global.dart';
import 'package:fun/common/route.dart';
import 'package:fun/model/theme.dart';
import 'package:provider/provider.dart';

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
    return Scaffold(
      body: CustomScrollView(
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
                      Theme.of(context).brightness == Brightness.light
                          ? Icons.brightness_5
                          : Icons.brightness_2,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  trailing: Switch(
                    activeColor: Theme.of(context).accentColor,
                    value: Theme.of(context).brightness == Brightness.dark,
                    onChanged: (_) {
//                      switchDarkMode();
                    },
                  ),
                ),
                ExpansionTile(
                  title: Text(Global.s.colorTheme),
                  leading: Icon(
                    Icons.color_lens,
                    color: Theme.of(context).accentColor,
                  ),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        children: <Widget>[
                          ...Colors.primaries
                              .map((color) => Material(
                                    color: color,
                                    child: InkWell(
                                      onTap: () {
                                        Provider.of<ThemeModel>(context)
                                            .switchTheme(color: color);
                                      },
                                      child: SizedBox(
                                        width: 40,
                                        height: 40,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          Material(
                            child: InkWell(
                              onTap: () {
                                Provider.of<ThemeModel>(context).switchRandomTheme();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Theme.of(context).accentColor,
                                  ),
                                ),
                                width: 40,
                                height: 40,
                                child: Text(
                                  '?',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Theme.of(context).accentColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ListTile(
                  title: Text(Global.s.setting),
                  onTap: () {
                    MyRoute.pushNamed(
                      MyRoute.setting,
                      routeType: AnimationType.CUPERTINO,
                    );
                  },
                  leading: Icon(
                    Icons.settings,
                    color: Theme.of(context).accentColor,
                  ),
                  trailing: Icon(Icons.chevron_right),
                ),
              ],
            ),
          ),
        ],
      ),
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
      Provider.of<ThemeModel>(context).switchTheme(
        isDarkMode: Theme.of(context).brightness == Brightness.light,
      );
    }
  }
}
