import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noviindus_task_2/presentation/pages/all_news_screen.dart/all_news_screen.dart';

import '../../controller/category_controller.dart';
import '../../core/const.dart';

class MyHomePager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBar with GetX'),
      ),
      body: MyTabBar(),
    );
  }
}

class MyTabBar extends StatefulWidget {
  @override
  _MyTabBarState createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  final CategoryController myController = Get.put(CategoryController());
  final blogController = Get.put(CategoryController());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: blogController.blogsCategory.length,
      child: Column(
        children: [
          TabBar(
            unselectedLabelColor: appBlack,
            indicatorColor: appBlack,
            labelColor: appLebelColor,
            tabs: blogController.blogsCategory
                .map((tab) => Tab(text: tab.name))
                .toList(),
          ),
          Expanded(
            child: TabBarView(
              children: blogController.blogsCategory
                  .map((tab) => AllNews(index: tab.id!))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class TabPage extends StatelessWidget {
  final MyTab tab;

  TabPage({required this.tab});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Get.to(NextPage(tabId: tab.id));
        },
        child: Text('Go to Next Page with ID: ${tab.id}'),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  final int tabId;

  NextPage({required this.tabId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
      ),
      body: Center(
        child: Text('Tab ID: $tabId'),
      ),
    );
  }
}

// class MyController extends GetxController {
//   RxList<MyTab> tabList = <MyTab>[].obs;

//   @override
//   void onInit() {
//     // Simulate fetching tabs from API
//     // You should replace this with your actual API call
//     fetchDataFromApi();
//     super.onInit();
//   }

//   void fetchDataFromApi() async {
//     // Simulating API response
//     await Future.delayed(Duration(seconds: 2));

//     // Replace this with actual API data parsing
//     tabList.assignAll([
//       MyTab(id: 1, name: 'Tab 1'),
//       MyTab(id: 2, name: 'Tab 2'),
//       MyTab(id: 3, name: 'Tab 3'),
//     ]);
//   }
// }

class MyTab {
  final int id;
  final String name;

  MyTab({required this.id, required this.name});
}
