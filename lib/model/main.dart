import 'package:flutter/material.dart';

///
/// 主模型
///
class MainModel extends ChangeNotifier {
  // 城市
  String _city = '太原市';

  // 获取城市
  String get city => _city;

  ///
  /// 设置城市
  ///
  setCity(city) {
    if (_city != city) {
      _city = city;
      notifyListeners();
    }
  }
}