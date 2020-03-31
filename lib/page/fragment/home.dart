import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:oktoast/oktoast.dart';

import 'package:fun/common/resource.dart';
import 'package:fun/entity/home_banner.dart';
import 'package:fun/entity/home_icon.dart';
import 'package:fun/entity/recommend_work.dart';
import 'package:fun/model/home.dart';
import 'package:fun/page/fragment/recommend.dart';
import 'package:fun/widget/loading_view.dart';
import 'package:fun/widget/search_appbar.dart';

///
/// 首页页面
///
/// @author zzzz1997
/// @created_time 20200114
///
class HomeFragment extends StatefulWidget {
  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

///
/// 首页页面状态
///
class _HomeFragmentState extends State<HomeFragment>
    with AutomaticKeepAliveClientMixin {
  // 状态模型
  final _model = HomeModel();

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
        child: Consumer<HomeModel>(
          builder: (_, m, __) => LoadingView(
            commonStatus: _model.status,
            isEmpty: _model.banners.isEmpty,
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
                              _buildBanner(_model.banners),
                              ..._buildImageButton(_model.icons),
                              _buildRecommend(_model.works),
                            ],
                          )
                        : RecommendFragment(_model.merchandises),
                    childCount: 2,
                  ),
                )
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
  /// 横幅组件
  ///
  Widget _buildBanner(List<HomeBanner> banners) {
    return AspectRatio(
      aspectRatio: 2.5,
      child: Swiper(
        autoplay: true,
        itemBuilder: (_, i) => ImageHelper.networkImage(
          banners[i].image.url,
          fit: BoxFit.cover,
        ),
        itemCount: banners.length,
      ),
    );
  }

  ///
  /// 构建图片按钮
  ///
  List<Widget> _buildImageButton(List<HomeIcon> icons) {
    return [
      SizedBox(
        height: 20,
      ),
      if (icons.length > 0)
        Row(
          children: <Widget>[
            _imageButton(icons[0]),
            _imageButton(icons[1]),
            _imageButton(icons[2]),
            _imageButton(icons[3]),
          ],
        ),
      SizedBox(
        height: 20,
      ),
      if (icons.length > 0)
        Row(
          children: <Widget>[
            _imageButton(icons[4]),
            _imageButton(icons[5]),
            _imageButton(icons[6]),
            _imageButton(icons[7]),
          ],
        ),
      SizedBox(
        height: 20,
      ),
    ];
  }

  ///
  /// 构建推荐
  ///
  Widget _buildRecommend(List<RecommendWork> works) {
    return Container(
      color: Color.fromARGB(255, 238, 230, 217),
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '推荐工作 >',
            style: TextStyle(
              color: Color.fromARGB(255, 32, 3, 3),
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _recommendImage(works[0]),
              _recommendImage(works[1]),
              _recommendImage(works[2]),
            ],
          )
        ],
      ),
    );
  }

  ///
  /// 图片按钮
  ///
  Widget _imageButton(HomeIcon icon) {
    return Expanded(
      child: Column(
        children: <Widget>[
          ImageHelper.networkImage(
            icon.icon.url,
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
          Text(
            icon.title,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  ///
  /// 推荐图片
  ///
  Widget _recommendImage(RecommendWork work) {
    return Column(
      children: <Widget>[
        ImageHelper.networkImage(
          work.image.url,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          work.name,
          style: TextStyle(
            color: Color.fromARGB(255, 32, 3, 3),
            fontSize: 13,
          ),
        ),
      ],
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
