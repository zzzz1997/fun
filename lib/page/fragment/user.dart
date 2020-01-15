import 'dart:math';

import 'package:flutter/material.dart';

import 'package:oktoast/oktoast.dart';

import 'package:fun/common/global.dart';
import 'package:fun/model/theme.dart';
import 'package:fun/widget/provider_widget.dart';

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
    print('build');
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
                    child: ProviderWidget<ThemeModel>(
                      builder: (_, m, __) => Icon(
                        !m.isDarkMode ? Icons.brightness_5 : Icons.brightness_2,
                      ),
                    ),
                  ),
                  trailing: ProviderWidget<ThemeModel>(
                    builder: (_, m, __) => Switch(
                      activeColor: Global.theme.accentColor,
                      value: m.isDarkMode,
                      onChanged: (_) {
//                      switchDarkMode();
                      },
                    ),
                  ),
                ),
                ExpansionTile(
                  title: Text(Global.s.colorTheme),
                  leading: Icon(
                    Icons.color_lens,
//                  color: Global.theme.accentColor,
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
                                        Global.model<ThemeModel>()
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
                                Global.model<ThemeModel>().switchRandomTheme();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Global.theme.accentColor,
                                  ),
                                ),
                                width: 40,
                                height: 40,
                                child: Text(
                                  '?',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Global.theme.accentColor,
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
      Global.model<ThemeModel>().switchTheme(
        isDarkMode: Global.theme.brightness == Brightness.light,
      );
    }
  }
}
