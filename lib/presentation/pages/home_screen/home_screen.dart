import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:noviindus_task_2/presentation/controller/category_controller.dart';
import 'package:noviindus_task_2/presentation/core/const.dart';

import '../../../data/category_service/category_service.dart';
import '../all_news_screen.dart/all_news_screen.dart';
import '../tabs/tab_1.dart';
import '../tabs/tab_2.dart';
import '../tabs/tab_3.dart';
import '../tabs/tab_4.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final blogController = Get.put(CategoryController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          log("clicked");

          blogController.getCategory();
          log("${blogController.blogsCategory.length}");
          //CategoryService.getCategeryImpl();
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
                    // indicator:CircularProgressIndicator(color: appOrenge,),
                    unselectedLabelColor: appBlack,
                    indicatorColor: appBlack,
                    labelColor: appLebelColor,
                    tabs: List.generate(
                      blogController.blogsCategory.length,
                      (index) {
                        return Container(
                          child: Tab(
                              text: blogController.blogsCategory[index].name!),
                        );
                      },
                    )),
              )
            ];
          },
          body: const TabBarView(
            children: [
              AllNews(),
              Tab2(),
              Tab3(),
              Tab4(),
              Tab3(),
              Tab4(),
            ],
          ),
        ),
      ),
    );
  }
}
