import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:noviindus_task_2/presentation/core/const.dart';
import 'package:noviindus_task_2/presentation/pages/each_news_screen/each_news_screen.dart';

import '../../../data/each_category_list_service/each_category_list_service.dart';
import '../../controller/category_controller.dart';
import '../../controller/each_category_list_controller.dart';
import '../latest_news_screen/latest_news_screen.dart';
import '../../widgets/custom_news_tile_widget.dart';
import 'widgets/read_more.dart';

class AllNews extends StatefulWidget {
  AllNews({required this.index, super.key});

  int index;

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  final eachCategoryController = Get.put(EachCategoryListController());
  final blogController = Get.put(CategoryController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    EachCategoryListService.getEachCategeryImpl();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: size.height * 0.38,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: appLebelColor,
              image: DecorationImage(
                  image: NetworkImage(
                    dummyImage1,
                    //
                  ),
                  fit: BoxFit.cover),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18, color: bg),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Lorem Ipsum is simply",
                    style: TextStyle(fontSize: 15, color: bg),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ReadMoreWidget(
            ontap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LatestNews(),
                )),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EachNewsScreen(),
                      ),
                    ),
                    child: Column(
                      children: [
                        CustomNewsTailWidgets(
                          img: imageBaseUrl +
                              eachCategoryController
                                  .blogsCategory[index].image!,
                          title: eachCategoryController
                              .blogsCategory[index].title!,
                          time: '20 Min',
                        ),
                        Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                          child:  Text(
                            eachCategoryController
                              .blogsCategory[index].content!,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 14,
                              color: appBlack,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                itemCount: eachCategoryController.blogsCategory.length),
          ),
        ],
      ),
    );
  }
}
