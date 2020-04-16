import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:provider/provider.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';

import 'package:fun/common/global.dart';
import 'package:fun/model/main.dart';
import 'package:fun/page/fragment/classification.dart';
import 'package:fun/page/fragment/course.dart';
import 'package:fun/page/fragment/home.dart';
import 'package:fun/page/fragment/shopping_cart.dart';
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
  // 页面控制器
  final PageController _controller = PageController();

  // 状态模型
  final _model = MainModel();

  // 碎片数组
  List<Widget> _list = [];

  // 位置
  int _index = 0;

  @override
  void initState() {
    super.initState();

    _list = [
      HomeFragment(),
      ClassificationFragment(),
      CourseFragment(),
      ShoppingCartFragment(),
      UserFragment(),
    ];

    SchedulerBinding.instance.addPostFrameCallback((_) {
      EasyRefresh.defaultHeader = MaterialHeader();
      EasyRefresh.defaultFooter = MaterialFooter(enableInfiniteLoad: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _model,
      child: Scaffold(
        body: PageView.builder(
          controller: _controller,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (_, i) => _list[i],
          itemCount: _list.length,
          onPageChanged: (index) {
            setState(() {
              _index = index;
            });
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(Global.s.home),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text(Global.s.classification),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              title: Text(Global.s.course),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text(Global.s.shopping_cart),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.tag_faces),
              title: Text(Global.s.mine),
            ),
          ],
          currentIndex: _index,
          onTap: (index) {
            _controller.jumpToPage(index);
          },
        ),
      ),
    );
  }
}
