import 'dart:developer';

import 'package:get/get.dart';
import 'package:noviindus_task_2/data/category_service/category_service.dart';

import '../../domain/category_model.dart';

class CategoryController extends GetxController {
  var loding = true.obs;
  RxList<BlogsCategory> blogsCategory = <BlogsCategory>[].obs;
  Future<List<BlogsCategory>?> getCategory() async {
    try {
      var data = await CategoryService.getCategeryImpl();
      loding.value = false;
      update();
      blogsCategory.value = data!;
      log("${ blogsCategory.value[0].name}");
      return blogsCategory;
    } catch (e) {
      log(' controll catch msg : $e');
    }
    return null;
  }

  @override
  void onInit() {
    super.onInit();
    getCategory();
  }
}
