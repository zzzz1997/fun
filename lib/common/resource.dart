import 'package:flutter/material.dart';

import 'package:extended_image/extended_image.dart';

///
/// 矢量图标
///
/// @author zzzz1997
/// @created_time 20200115
///
class IconFonts {
  // 图标库名
  static const String _fontFamily = 'iconfont';

  // 扫描二维码图标
  static const IconData scanQrcode = IconData(0xe66e, fontFamily: _fontFamily);
}

///
/// 图片帮助类
///
class ImageHelper {
  ///
  /// 网络图片
  ///
  static ExtendedImage networkImage(String url,
      {double width, double height, BoxFit fit}) {
    return ExtendedImage.network(
      url,
      width: width,
      height: height,
      fit: fit,
      loadStateChanged: (ExtendedImageState s) =>
          s.extendedImageLoadState == LoadState.loading
              ? Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                  ),
                )
              : s.extendedImageLoadState == LoadState.failed
                  ? Center(
                      child: Icon(Icons.error_outline),
                    )
                  : null,
    );
  }

  ///
  /// 本地资源图片
  ///
  static Image assetImage(String name,
      {double width, double height, BoxFit fit}) {
    return Image.asset(
      'assets/images/$name',
      width: width,
      height: height,
      fit: fit,
    );
  }
}

///
///
/// 样式
class Style {
  // 红色
  static Color colorRed = Color(0xFFF23030);

  // 按钮灰
  static Color iconGrey = Color(0xFFCCCCCC);
}
