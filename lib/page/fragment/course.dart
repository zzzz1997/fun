import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:oktoast/oktoast.dart';

import 'package:fun/common/resource.dart';
import 'package:fun/entity/course.dart';
import 'package:fun/model/course.dart';
import 'package:fun/page/fragment/recommend.dart';
import 'package:fun/widget/loading_view.dart';
import 'package:fun/widget/search_appbar.dart';

///
/// 课程页面
///
/// @author zzzz1997
/// @created_time 20200115
///
class CourseFragment extends StatefulWidget {
  @override
  _CourseFragmentState createState() => _CourseFragmentState();
}

///
/// 首页页面状态
///
class _CourseFragmentState extends State<CourseFragment>
    with AutomaticKeepAliveClientMixin {
  // 状态模型
  final _model = CourseModel();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadData(true);
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: SearchAppBar(),
      body: ChangeNotifierProvider.value(
        value: _model,
        child: Consumer<CourseModel>(
          builder: (_, m, __) => LoadingView(
            commonStatus: _model.status,
            isEmpty: _model.courses.isEmpty,
            child: EasyRefresh.custom(
              footer: MaterialFooter(enableInfiniteLoad: !_model.noMore),
              onRefresh: () async {
                await _loadData(true);
              },
              onLoad: () async {
                await _loadData(false);
              },
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (_, i) => i == 0
                        ? Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text('查看更多>>'),
                                ),
                              ),
                              ..._buildImageButton(_model.courses),
                            ],
                          )
                        : RecommendFragment(_model.merchandises),
                    childCount: 2,
                  ),
                ),
              ],
            ),
            onErrorTap: () {
              _loadData(true);
            },
          ),
        ),
      ),
    );
  }

  ///
  /// 构建图片按钮
  ///
  List<Widget> _buildImageButton(List<Course> courses) {
    return [
      Row(
        children: <Widget>[
          _imageButton(courses[0]),
          _imageButton(courses[1]),
          _imageButton(courses[2]),
        ],
      ),
      SizedBox(
        height: 20,
      ),
      Row(
        children: <Widget>[
          _imageButton(courses[3]),
          _imageButton(courses[4]),
          _imageButton(courses[5]),
        ],
      ),
      SizedBox(
        height: 20,
      ),
    ];
  }

  ///
  /// 图片按钮
  ///
  Widget _imageButton(Course course) {
    return Expanded(
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            child: ImageHelper.networkImage(
              course.cover.url,
              width: 90,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            course.name,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  ///
  /// 加载数据
  ///
  _loadData(bool isRefresh) async {
    try {
      if (isRefresh) {
        await _model.init();
      } else {
        await _model.loadMore();
      }
    } catch (e) {
      showToast(e.toString());
    }
  }
}
