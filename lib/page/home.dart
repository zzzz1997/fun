import 'package:flutter/material.dart';

import 'package:fun/common/global.dart';
import 'package:fun/page/fragment/attention.dart';
import 'package:fun/page/fragment/home.dart';
import 'package:fun/page/fragment/user.dart';

///
/// 主页面
///
/// @author zzzz1997
/// @created_time 20191121
///
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

///
/// 主页面状态
///
class _HomePageState extends State<HomePage> {
  // 图标
  static const icon = 'icon';

  // 标题
  static const title = 'title';

  // 视图
  static const view = 'view';

  // 页面控制器
  final PageController _controller = PageController();

  // 碎片数组
  List<Map<String, Object>> _list = [];

  // 位置
  int _index = 0;

  @override
  void initState() {
    super.initState();

    _list = [
      {
        icon: Icons.home,
        title: Global.s.home,
        view: HomeFragment(),
      },
      {
        icon: Icons.star,
        title: Global.s.attention,
        view: AttentionFragment(),
      },
      {
        icon: Icons.tag_faces,
        title: Global.s.attention,
        view: UserFragment(),
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (_, i) => _list[i][view],
        itemCount: _list.length,
        onPageChanged: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _list
            .map((m) => BottomNavigationBarItem(
                  icon: Icon(m[icon]),
                  title: Text(m[title]),
                ))
            .toList(),
        currentIndex: _index,
        onTap: (index) {
          _controller.jumpToPage(index);
        },
      ),
    );
  }
}
