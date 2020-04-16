import 'package:flutter/material.dart';

import 'package:fun/common/global.dart';
import 'package:fun/common/resource.dart';
import 'package:fun/page/fragment/home.dart';

///
/// 分类页面
///
/// @author zzzz1997
/// @created_time 20200115
///
class ClassificationFragment extends StatefulWidget {
  @override
  _ClassificationFragmentState createState() => _ClassificationFragmentState();
}

///
/// 首页页面状态
///
class _ClassificationFragmentState extends State<ClassificationFragment>
    with AutomaticKeepAliveClientMixin {
  final list = [
    '剪纸',
    '陶瓷',
    '泥塑',
    '木雕',
    '风筝',
    '竹编',
    '印染',
    '石雕',
    '书画',
    '木偶',
    '布艺刺绣',
    '皮影'
  ];

  final data = [
    Classification('im_cover_classification_0.jpg', [
      SecondClassification('新婚剪纸画', [
        ThirdClassification('im_classification_0_0.jpg'),
        ThirdClassification('im_classification_0_1.jpg'),
        ThirdClassification('im_classification_0_2.jpg'),
      ]),
      SecondClassification('新春福字剪纸画', [
        ThirdClassification('im_classification_0_3.jpg'),
        ThirdClassification('im_classification_0_4.jpg'),
        ThirdClassification('im_classification_0_5.jpg'),
      ]),
      SecondClassification('中国风剪纸画', [
        ThirdClassification('im_classification_0_6.jpg'),
        ThirdClassification('im_classification_0_7.jpg'),
        ThirdClassification('im_classification_0_8.jpg'),
        ThirdClassification('im_classification_0_9.jpg'),
        ThirdClassification('im_classification_0_10.jpg'),
        ThirdClassification('im_classification_0_11.jpg'),
      ]),
    ]),
    Classification('im_cover_classification_1.jpg', [
      SecondClassification('瓷器类别', [
        ThirdClassification(
          'im_classification_1_0.jpg',
          name: '碗',
        ),
        ThirdClassification(
          'im_classification_1_1.jpg',
          name: '壶',
        ),
        ThirdClassification(
          'im_classification_1_2.jpg',
          name: '瓶',
        ),
        ThirdClassification(
          'im_classification_1_3.jpg',
          name: '杯',
        ),
        ThirdClassification(
          'im_classification_1_4.jpg',
          name: '罐',
        ),
        ThirdClassification(
          'im_classification_1_5.jpg',
          name: '盘',
        ),
      ]),
      SecondClassification('新春福字剪纸画', [
        ThirdClassification('im_classification_1_6.jpg'),
        ThirdClassification('im_classification_1_7.jpg'),
        ThirdClassification('im_classification_1_8.jpg'),
        ThirdClassification('im_classification_1_9.jpg'),
        ThirdClassification('im_classification_1_10.jpg'),
        ThirdClassification('im_classification_1_11.jpg'),
      ]),
    ]),
  ];

  // 默认位置
  int _index = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: HomeFragment.buildAppBar(context),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildClassification(),
          _buildContent(),
        ],
      ),
    );
  }

  ///
  /// 构建分类栏
  ///
  Widget _buildClassification() {
    return Container(
      color: Global.brightnessColor(context,
          light: Color(0xFFF0F0F0), dark: Colors.black38),
      width: 90,
      height: double.infinity,
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (_, i) => InkWell(
          onTap: () {
            if ([0, 1].contains(i) && _index != i) {
              setState(() {
                _index = i;
              });
            }
          },
          child: Container(
            width: 90,
            height: 50,
            child: Center(
              child: Text(
                list[i],
                style: TextStyle(
                  color: _index == i
                      ? Style.colorRed
                      : Theme.of(context).textTheme.bodyText1.color,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ),
        itemCount: list.length,
      ),
    );
  }

  ///
  /// 构建内容
  ///
  Widget _buildContent() {
    var classification = data[_index];
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ImageHelper.assetImage(
              classification.cover,
              fit: BoxFit.fitWidth,
            ),
            ...classification.list
                .map((s) {
                  var size = 3;
                  var length = (s.list.length / size).ceil();
                  var rows = List<Widget>(length);
                  var list;
                  var widgets = List<Widget>(size);
                  for (var i = 0; i < length; i++) {
                    list = s.list.sublist(size * i,
                        i == length - 1 ? s.list.length : size * i + size);
                    for (var j = 0; j < size; j++) {
                      widgets[j] = j < list.length
                          ? Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    AspectRatio(
                                      aspectRatio: 1,
                                      child: ImageHelper.assetImage(
                                        list[j].image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    if (list[j].name.isNotEmpty)
                                      Text(
                                        list[j].name,
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            )
                          : Spacer();
                    }
                    rows[i] = Row(
                      children: [...widgets],
                    );
                  }
                  return [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Text(
                        s.name,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    ...rows,
                  ];
                })
                .expand((i) => i)
                .toList(),
          ],
        ),
      ),
    );
  }
}

///
/// 分类实体
///
class Classification {
  // 标题
  final String cover;

  final List<SecondClassification> list;

  Classification(this.cover, this.list);
}

///
/// 二级分类实体
///
class SecondClassification {
  // 名称
  final String name;

  final List<ThirdClassification> list;

  SecondClassification(this.name, this.list);
}

///
/// 三级分类
///
class ThirdClassification {
  // 图片
  final String image;

  // 名字
  final String name;

  ThirdClassification(this.image, {this.name = ''});
}
