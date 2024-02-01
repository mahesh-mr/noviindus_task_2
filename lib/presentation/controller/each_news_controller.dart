import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/each_news_service/each_news_service.dart';
import '../../domain/each_news_model.dart';

class EachNewsController extends GetxController {
  var loding = true.obs;
Rx<EachNewsModel> eachNewsModel = EachNewsModel().obs;
Future<EachNewsModel?> getEachNews({required int id}) async {
    try {
      var data = await EachNewsServiceImpl.getEwahNewsImpl(id:id );
      loding.value = false;
      update();
      eachNewsModel.value = data!;
      log("msg  cont: ${eachNewsModel.value.blog!.title!}");
      update();
      return eachNewsModel.value;
    } catch (e) {
      log(' controll catch msg : $e');
    }
    return null;
  }
  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();
  //   getEachNews();
  // }
}
