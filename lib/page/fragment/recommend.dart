import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:fun/common/resource.dart';
import 'package:fun/entity/recommend_merchandise.dart';

///
/// 为你推荐
///
/// @author zzzz1997
/// @created_time 20200316
///
class RecommendFragment extends StatelessWidget {
  // 商品
  final List<RecommendMerchandise> merchandise;

  RecommendFragment(this.merchandise);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Text(
          '为 / 你 / 推 / 荐',
          style: TextStyle(
            color: Color.fromARGB(255, 244, 124, 255),
            fontSize: 18,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        StaggeredGridView.countBuilder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          itemCount: merchandise.length,
          itemBuilder: (_, i) => _buildMerchandise(merchandise[i]),
          staggeredTileBuilder: (_) => StaggeredTile.fit(1),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
      ],
    );
  }

  ///
  /// 构建商品
  ///
  Widget _buildMerchandise(RecommendMerchandise merchandise) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ImageHelper.networkImage(
          merchandise.cover.url,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(
            5,
            5,
            5,
            10,
          ),
          child: Text(
            merchandise.name,
            style: TextStyle(fontSize: 13),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                merchandise.price == 0
                    ? '免费'
                    : '￥${merchandise.price.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Style.colorRed,
                  fontSize: 15,
                ),
              ),
              Text(
                '看相似',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
