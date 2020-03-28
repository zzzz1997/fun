import 'package:flutter/material.dart';
import 'package:fun/widget/loading_view.dart';

import 'package:provider/provider.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:oktoast/oktoast.dart';

import 'package:fun/common/resource.dart';
import 'package:fun/model/home.dart';
import 'package:fun/page/fragment/recommend.dart';
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
  // 刷新键
  final _key = GlobalKey<RefreshIndicatorState>();

  // 状态模型
  final _model = HomeModel();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _key.currentState.show();
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: SearchAppBar(),
      body: RefreshIndicator(
        key: _key,
        onRefresh: _loadData,
        child: ListView.builder(
          itemBuilder: (_, i) => ChangeNotifierProvider.value(
            value: _model,
            child: Consumer<HomeModel>(
              builder: (_, m, __) => LoadingView(
                commonStatus: _model.status,
                isEmpty: _model.banners.isEmpty,
                child: Column(
                  children: <Widget>[
                    _buildBanner(),
                    ..._buildImageButton(),
                    _buildRecommend(),
//            RecommendFragment([
//              Merchandise('手工仿古竹编包竹篮子茶篮杂物篮装饰摆设花器花插竹制品摆件',
//                  'im_merchandise_home_0.jpg', 28.5),
//              Merchandise('竹制品花器花艺茶道装饰摆件手工竹编禅意日式中式插花干花鲜花',
//                  'im_merchandise_home_1.jpg', 28.5),
//              Merchandise('剪纸手工中国风相框装饰摆件特色礼品送老外外事出国礼物公司定制',
//                  'im_merchandise_home_2.jpg', 28.5),
//              Merchandise('仿古小屏风摆件特色礼物送老外中国风熊猫屏风北京特产传统工艺品',
//                  'im_merchandise_home_3.jpg', 28.5),
//              Merchandise('川剧变脸熊猫泥人四川特色小礼物京剧熊猫纪念品特色礼品送老外',
//                  'im_merchandise_home_4.jpg', 28.5),
//              Merchandise('潮州传统工艺品纯手工花茉莉陶瓷花白色禅意摆件摆设香插线香香座',
//                  'im_merchandise_home_5.jpg', 28.5),
//            ]),
                  ],
                ),
                onErrorTap: _loadData,
              ),
            ),
          ),
          itemCount: 1,
        ),
      ),
    );
  }

  ///
  /// 横幅组件
  ///
  Widget _buildBanner() {
    return AspectRatio(
      aspectRatio: 2.5,
      child: Swiper(
        autoplay: true,
        itemBuilder: (_, i) => ImageHelper.assetImage(
          'im_banner_home_$i.jpg',
          fit: BoxFit.cover,
        ),
        itemCount: 4,
      ),
    );
  }

  ///
  /// 构建图片按钮
  ///
  List<Widget> _buildImageButton() {
    return [
      SizedBox(
        height: 20,
      ),
      Row(
        children: <Widget>[
          _imageButton('icons/bird.png', '继承者加盟'),
          _imageButton('icons/blog.png', '慧眼识珠'),
          _imageButton('icons/Check.png', '技艺课程'),
          _imageButton('icons/Cogwheel.png', '微众筹'),
        ],
      ),
      SizedBox(
        height: 20,
      ),
      Row(
        children: <Widget>[
          _imageButton('icons/flag.png', '继承者加盟'),
          _imageButton('icons/globe.png', '慧眼识珠'),
          _imageButton('icons/group people.png', '技艺课程'),
          _imageButton('icons/heart.png', '微众筹'),
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
  Widget _buildRecommend() {
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
              _recommendImage('im_recommend_home_0.jpg', '打银'),
              _recommendImage('im_recommend_home_1.jpg', '雕刻'),
              _recommendImage('im_recommend_home_2.jpg', '制陶'),
            ],
          )
        ],
      ),
    );
  }

  ///
  /// 图片按钮
  ///
  Widget _imageButton(image, title) {
    return Expanded(
      child: Column(
        children: <Widget>[
          ImageHelper.assetImage(
            image,
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
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

  ///
  /// 推荐图片
  ///
  Widget _recommendImage(image, title) {
    return Column(
      children: <Widget>[
        ImageHelper.assetImage(
          image,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          title,
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
  Future<void> _loadData() async {
    try {
      await _model.init();
    } catch (e) {
      showToast(e.toString());
    }
  }
}
