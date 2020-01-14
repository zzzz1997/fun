import 'package:flutter/material.dart';

import 'package:fun/common/global.dart';

///
/// 搜索appBar
///
/// @author zzzz1997
/// @created_time 20200114
///
class SearchAppBar extends PreferredSize {
  SearchAppBar()
      : super(
          child: Material(
            elevation: 4,
            child: Container(
              padding: EdgeInsets.fromLTRB(
                NavigationToolbar.kMiddleSpacing,
                Global.mediaQuery.padding.top +
                    NavigationToolbar.kMiddleSpacing,
                NavigationToolbar.kMiddleSpacing,
                NavigationToolbar.kMiddleSpacing,
              ),
              child: Text('搜索'),
            ),
          ),
          preferredSize: Size(
            double.infinity,
            kToolbarHeight,
          ),
        );
}
