import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:noviindus_task_2/presentation/pages/each_news_screen/each_news_screen.dart';

import '../../widgets/custom_news_tile_widget.dart';
import '../../core/const.dart';

class LatestNews extends StatelessWidget {
  const LatestNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        leading: const Icon(
          CupertinoIcons.chevron_left_circle,
        ),
        title: const Text('Latest News'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EachNewsScreen(),
                ),
              ),
              child: Column(
                children: [
                  CustomNewsTailWidgets(img: dummyImage2, title:    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  time: '20 Min'),
                  const Text(
                    dummyText,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 14,
                      color: appBlack,
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                height: 20,
              ),
          itemCount: 10),
    );
  }
}
