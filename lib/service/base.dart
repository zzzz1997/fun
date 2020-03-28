import 'package:data_plugin/bmob/bmob_query.dart';
import 'package:data_plugin/bmob/response/bmob_error.dart';
import 'package:data_plugin/bmob/table/bmob_object.dart';

///
/// 主页服务
///
/// @author zzzz1997
/// @created_time 20200323
///
class BaseService {
  static Future<List> getList<T extends BmobObject>() async {
    try {
      var query = BmobQuery<T>();
      return await query.queryObjects();
    } catch (e) {
      throw BmobError.convert(e);
    }
  }
}
