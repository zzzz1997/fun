import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import 'package:fun/generated/i18n.dart';

///
/// 全局参数
///
/// @author zzzz1997
/// @created_time 20191121
///
class Global {
  // 导航键
  static final GlobalKey<NavigatorState> key =
      GlobalKey(debugLabel: 'navigate_key');

  // 导航器
  static NavigatorState get navigator => key.currentState;

  // 上下文
  static BuildContext get context => key.currentContext;

  // 国际化对象
  static S get s => S.of(context);

  // 主题信息
  static ThemeData get theme => Theme.of(context);

  // 设备信息
  static MediaQueryData get mediaQuery => MediaQuery.of(context);

  // SharedPreferences对象
  static SharedPreferences sharedPreferences;

  ///
  /// 初始化
  ///
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  ///
  /// 获取模型
  ///
  static T model<T>() {
    return Provider.of<T>(context);
  }
}
