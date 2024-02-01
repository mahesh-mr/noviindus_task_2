import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:noviindus_task_2/presentation/controller/category_controller.dart';
import 'package:noviindus_task_2/presentation/core/const.dart';
import '../../controller/each_category_list_controller.dart';
import '../all_news_screen.dart/all_news_screen.dart';
import 'package:get_storage/get_storage.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final blogController = Get.put(CategoryController());

  final eachCategoryController = Get.put(EachCategoryListController());

  final store = GetStorage();
  @override
  Widget build(BuildContext context) {
    //  final int id = store.read('categoryId');
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          eachCategoryController.getCategory();
        },
      ),
      body: DefaultTabController(
        length: 4,
        child: NestedScrollView(
          headerSliverBuilder: (context, index) {
            return [
              SliverAppBar(
                title: Text('Nwes & Blogs'),
                elevation: 0,
                foregroundColor: appBlack,
                bottom: TabBar(
                  isScrollable: true,
                  onTap: (value) {
                    final int id = store.read('categoryId');
                    //id;
                    log('msg id $id');
                  },
                  unselectedLabelColor: appBlack,
                  indicatorColor: appBlack,
                  labelColor: appLebelColor,
                  tabs: List.generate(
                    blogController.blogsCategory.length,
                    (index) {
                      return Obx(() {
                        if (blogController.loding.value) {
                          CircularProgressIndicator();
                        }
                        return Tab(
                            text: blogController.blogsCategory[index].name
                                .toString());
                      });
                    },
                  ),
                ),
              )
            ];
          },
          body: TabBarView(
            children:
                List.generate(blogController.blogsCategory.length, (index) {
              log("${blogController.blogsCategory[index].id}");
              store.write(
                  'categoryId', blogController.blogsCategory[index].id!);
              return AllNews(
                index: blogController.blogsCategory[index].id!,
              );
            }),
          ),
        ),
      ),
    );
  }
}
