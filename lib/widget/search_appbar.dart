import 'package:flutter/material.dart';

import 'package:fun/common/global.dart';
import 'package:fun/common/resource.dart';

///
/// 搜索appBar
///
/// @author zzzz1997
/// @created_time 20200114
///
class SearchAppBar extends PreferredSize {
  SearchAppBar()
      : super(
          child: Material(
            elevation: 4,
            child: Container(
              height: kToolbarHeight + Global.mediaQuery.padding.top,
              padding: EdgeInsets.only(
                top: Global.mediaQuery.padding.top,
              ),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.location_on),
                      Text(
                        '太原市',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: 32,
                      decoration: ShapeDecoration(
                        shape: StadiumBorder(),
                        color: Color(0xFFF0F0F0),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.search,
                            size: 20,
                            color: Color(0xFFCCCCCC),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              '搜索',
                              style: TextStyle(
                                color: Color(0xFFCCCCCC),
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.keyboard_voice,
                            size: 20,
                            color: Color(0xFFCCCCCC),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: Icon(
                      IconFonts.scanQrcode,
                      size: 20,
                      color: Color(0xFFCCCCCC),
                    ),
                  ),
                ],
              ),
            ),
          ),
          preferredSize: Size(
            double.infinity,
            kToolbarHeight + Global.mediaQuery.padding.top,
          ),
        );
}
