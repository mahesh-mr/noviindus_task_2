import 'dart:developer';

import 'package:get/get.dart';
import '../../data/each_category_list_service/each_category_list_service.dart';
import '../../domain/each_category_model.dart';

class EachCategoryListController extends GetxController {
  var loding = true.obs;
  RxList<Results> blogsCategory = <Results>[].obs;
  Future<List<Results>?> getCategory(
    {required int categoryId}
  ) async {
    try {
      var data = await EachCategoryListService.getEachCategeryImpl(
       categoryId: categoryId,
          );
      loding.value = false;
      update();
      blogsCategory.value = data!;
      log("${blogsCategory.value[0].title}");
      return blogsCategory;
    } catch (e) {
      log(' controll catch msg : $e');
    }
    return null;
  }
}
