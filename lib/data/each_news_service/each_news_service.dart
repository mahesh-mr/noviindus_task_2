import 'dart:developer';

import 'package:dio/dio.dart';

import '../../domain/each_news_model.dart';
import '../core/dio_clint.dart';

class EachNewsServiceImpl {
  static Future<EachNewsModel?> getEwahNewsImpl(
    {required int id}
  ) async {
    try {
      var res = await DioClint.dio.get('news-and-blogs-details/$id');
      EachNewsModel eachNewsModel = EachNewsModel.fromJson(res.data);
      log("msg : ${res.data}");
      return eachNewsModel;
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      log("msg : ${e.message}");
      log("msg : ${e.error}");
    } catch (e) {
      log("msg : $e");
    }
  }
}
