import 'dart:developer';

import 'package:dio/dio.dart';
import '../../domain/each_category_model.dart';
import '../core/dio_clint.dart';

class EachCategoryListService {
  static Future<List<Results>?> getEachCategeryImpl(
  {required int categoryId, }
      ) async {
    try {
      FormData formdata =
          FormData.fromMap({'category': categoryId, 'page': 2});

      var res = await DioClint.dio.post('news-and-blogs-catg', data: formdata);
      EachCategoryModel model = EachCategoryModel.fromJson(res.data);
      return model.results;
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      log("msg : ${e.message}");
      log("msg : ${e.error}");
    } catch (e) {
      log("msg : $e");
    }
    return null;
  }
}
