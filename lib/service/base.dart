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
  static Future<List> getList<T extends BmobObject>(
      {int page = 1,
      int size = 5,
      bool all = false,
      Map<String, Object> equal = const {}}) async {
    try {
      var query = BmobQuery<T>();
      if (!all) {
        query.setLimit(size);
        query.setSkip((page - 1) * size);
      }
      equal.forEach((key, value) {
        query.addWhereEqualTo(key, value);
      });
      return await query.queryObjects();
    } catch (e) {
      throw BmobError.convert(e);
    }
  }
}
