import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noviindus_task_2/presentation/core/const.dart';

import '../../../data/each_news_service/each_news_service.dart';
import '../../controller/each_news_controller.dart';
import '../../widgets/custom_news_tile_widget.dart';

class EachNewsScreen extends StatefulWidget {
   EachNewsScreen({required this.index,
    super.key});
int index;
  @override
  State<EachNewsScreen> createState() => _EachNewsScreenState();
}

class _EachNewsScreenState extends State<EachNewsScreen> {
  final eachNewsController = Get.put(
    EachNewsController(),
  );
  @override
  void initState() {
    super.initState();
    eachNewsController.getEachNews(id: widget.index);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
          leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(
          CupertinoIcons.chevron_left_circle,
        ),
      )),
      body: SingleChildScrollView(
        child: Obx(() {
          final data = eachNewsController.eachNewsModel.value.blog;
          if (eachNewsController.loding.value) {
            return const Center(
              child: CircularProgressIndicator(
                color: appLebelColor,
              ),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.03,
                ),
                child: CustomNewsTailWidgets(
                  img: imageBaseUrl + data!.image!,
                  title: data.title!,
                  time: '20 Min',
                  height: 0.28,
                ),
              ),
              Container(
                height: 40,
                width: double.infinity,
                color: const Color.fromARGB(255, 217, 215, 215),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    child: Text(
                      'Updated: ${data.createdAt!}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: appLebelColor),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                child: Text(
                  data.content!,
                  // maxLines: 2,
                  style: const TextStyle(
                    fontSize: 14,
                    color: appBlack,
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
