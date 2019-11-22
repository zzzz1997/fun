import 'package:flutter/material.dart';

import 'package:fun/common/global.dart';

///
/// 主题模型
///
/// @author zzzz1997
/// @created_time 20191122
///
class ThemeModel extends ChangeNotifier {
  // 明暗模式键
  static const kIsDarkTheme = 'kIsDarkTheme';

  // 明暗模式
  bool _isDarkTheme;

  ThemeModel() {
    _isDarkTheme = Global.sharedPreferences.getBool(kIsDarkTheme) ?? false;
  }
}
