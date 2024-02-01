import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:noviindus_task_2/data/core/dio_clint.dart';
import '../../domain/category_model.dart';

class CategoryService {
  static Future<List<BlogsCategory>?> getCategeryImpl() async {
    try {
      var res = await DioClint.dio.get('news-and-blogs');
      CategoryModel categoryModel = CategoryModel.fromJson(res.data);
      log("msg : ${res.data}");
      return categoryModel.blogsCategory;
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
