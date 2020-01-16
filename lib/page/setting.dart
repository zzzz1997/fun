import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:fun/common/global.dart';
import 'package:fun/model/locale.dart';
import 'package:fun/model/theme.dart';

///
/// 设置页面
///
/// @author zzzz1997
/// @created_time 20200116
///
class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Global.s.setting),
      ),
      body: SingleChildScrollView(
        child: ListTileTheme(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Material(
                color: Theme.of(context).cardColor,
                child: ExpansionTile(
                  title: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(Global.s.font),
                      ),
                      Text(
                        ThemeModel.fontName(
                            Provider.of<ThemeModel>(context).fontIndex),
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                  leading: Icon(
                    Icons.font_download,
                    color: Theme.of(context).accentColor,
                  ),
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (_, i) {
                        var model = Provider.of<ThemeModel>(context);
                        return RadioListTile(
                          value: i,
                          groupValue: model.fontIndex,
                          onChanged: (i) {
                            model.switchFont(i);
                          },
                          title: Text(ThemeModel.fontName(i)),
                        );
                      },
                      itemCount: ThemeModel.fontValueList.length,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Material(
                color: Theme.of(context).cardColor,
                child: ExpansionTile(
                  title: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(Global.s.language),
                      ),
                      Text(
                        LocaleModel.localeName(
                            Provider.of<LocaleModel>(context).localeIndex),
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                  leading: Icon(
                    Icons.public,
                    color: Theme.of(context).accentColor,
                  ),
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (_, i) {
                        var model = Provider.of<LocaleModel>(context);
                        return RadioListTile(
                          value: i,
                          groupValue: model.localeIndex,
                          onChanged: (i) {
                            model.switchLocale(i);
                          },
                          title: Text(LocaleModel.localeName(i)),
                        );
                      },
                      itemCount: LocaleModel.localeValueList.length,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
