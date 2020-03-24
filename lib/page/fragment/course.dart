import 'package:flutter/material.dart';

import 'package:fun/common/resource.dart';
import 'package:fun/entity/merchandise.dart';
import 'package:fun/page/fragment/recommend.dart';
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
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: SearchAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text('查看更多>>'),
              ),
            ),
            ..._buildImageButton(),
//            RecommendFragment([
//              Merchandise('竹编教学视频课程教程大全', 'im_merchandise_course_0.jpg', 0),
//              Merchandise(
//                  '陶艺拉坯视频教程台湾林新春拉坯教学全集', 'im_merchandise_course_1.jpg', 10.5),
//              Merchandise('吹糖人技术资料吹糖糖人模糖塑面塑大全吹糖人捏面人工艺教程',
//                  'im_merchandise_course_2.jpg', 7.5),
//              Merchandise(
//                  '油纸伞女古风中国风工艺绸布伞教学视频', 'im_merchandise_course_3.jpg', 0),
//              Merchandise('剪纸工具套装刻纸剪纸剪刀垫板雕刻刀刻板学生剪纸教学视频',
//                  'im_merchandise_course_4.jpg', 8.5),
//              Merchandise('中国结编制教学视频', 'im_merchandise_course_5.jpg', 0),
//            ]),
          ],
        ),
      ),
    );
  }

  ///
  /// 构建图片按钮
  ///
  List<Widget> _buildImageButton() {
    return [
      Row(
        children: <Widget>[
          _imageButton('im_course_course_0.jpg', '蛋雕课程'),
          _imageButton('im_course_course_1.jpg', '糖画课程'),
          _imageButton('im_course_course_2.jpg', '竹编课程'),
        ],
      ),
      SizedBox(
        height: 20,
      ),
      Row(
        children: <Widget>[
          _imageButton('im_course_course_3.jpg', '布贴画课程'),
          _imageButton('im_course_course_4.jpg', '剪纸课程'),
          _imageButton('im_course_course_5.jpg', '活字印刷术课程'),
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
  Widget _imageButton(image, title) {
    return Expanded(
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            child: ImageHelper.assetImage(
              image,
              width: 90,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10,),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
