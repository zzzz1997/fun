import 'package:flutter/material.dart';

import 'package:fun/common/global.dart';
import 'package:fun/common/resource.dart';

///
/// 搜索appBar
///
/// @author zzzz1997
/// @created_time 20200114
///
class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  // 左组件
  final Widget left;

  // 右组件
  final Widget right;

  // 搜索点击事件
  final Function onSearchTap;

  // 左点击事件
  final Function onLeftTap;

  // 右点击事件
  final Function onRightTap;

  // 底部组件
  final PreferredSizeWidget bottom;

  SearchAppBar({
    @required this.left,
    this.right,
    this.onSearchTap,
    this.onLeftTap,
    this.onRightTap,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    Widget l = Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: left,
    );
    if (onLeftTap != null) {
      l = InkWell(
        onTap: onLeftTap,
        child: l,
      );
    }
    Widget s = Container(
      height: 32,
      decoration: ShapeDecoration(
        shape: StadiumBorder(),
        color: Color(0xFFF0F0F0),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.search,
            size: 20,
            color: Style.iconGrey,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              '搜索',
              style: TextStyle(
                color: Style.iconGrey,
                fontSize: 14,
              ),
            ),
          ),
          Icon(
            Icons.keyboard_voice,
            size: 20,
            color: Style.iconGrey,
          ),
        ],
      ),
    );
    if (onSearchTap != null) {
      s = GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onSearchTap,
        child: s,
      );
    }
    Widget r;
    if (right != null) {
      r = Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: right,
      );
      if (onRightTap != null) {
        r = InkWell(
          onTap: onRightTap,
          child: r,
        );
      }
    } else {
      r = SizedBox(
        width: 10,
      );
    }
    Widget bar = Container(
      height: kToolbarHeight + Global.mediaQuery.padding.top,
      padding: EdgeInsets.only(
        top: Global.mediaQuery.padding.top,
      ),
      child: Row(
        children: <Widget>[
          l,
          Expanded(
            child: s,
          ),
          r,
        ],
      ),
    );
    if (bottom != null) {
      bar = Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          bar,
          SizedBox(
            height: bottom.preferredSize.height,
            child: bottom,
          ),
        ],
      );
    }
    return Material(
      elevation: 4,
      child: bar,
    );
  }

  @override
  Size get preferredSize => Size(
      double.infinity,
      kToolbarHeight +
          Global.mediaQuery.padding.top +
          (bottom?.preferredSize?.height ?? 0));
}
