import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

///
/// provider组件
///
/// @author zzzz1997
/// @created_time 20200114
///
class ProviderWidget<T extends ChangeNotifier> extends StatelessWidget {
  // 构造器
  final Widget Function(BuildContext context, T value, Widget child) builder;

  // 子组件
  final Widget child;

  ProviderWidget({@required this.builder, this.child});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: Provider.of<T>(context),
      child: Consumer<T>(
        builder: builder,
        child: child,
      ),
    );
  }
}
