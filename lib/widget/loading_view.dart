import 'package:flutter/material.dart';

import 'package:fun/model/common.dart';

///
/// 加载视图组件
///
/// @author zzzz1997
/// @created_time 20200327
///
// ignore: must_be_immutable
class LoadingView extends StatelessWidget implements PreferredSizeWidget {
  // 状态
  final CommonStatus commonStatus;

  // 子组件
  final Widget child;

  // 数据是否为空
  final bool isEmpty;

  // 请求失败点击事件
  final Function onErrorTap;

  LoadingView(
      {@required this.commonStatus,
      @required this.child,
      @required this.isEmpty,
      @required this.onErrorTap});

  @override
  Widget build(BuildContext context) {
    return commonStatus == CommonStatus.LOADING && isEmpty
        ? Center(
            child: CircularProgressIndicator(),
          )
        : commonStatus == CommonStatus.DONE
            ? isEmpty
                ? Center(
                    child: SizedBox(),
                  )
                : child
            : InkWell(
                onTap: onErrorTap,
                child: Center(
                  child: SizedBox(),
                ),
              );
  }

  @override
  Size get preferredSize => null;
}
