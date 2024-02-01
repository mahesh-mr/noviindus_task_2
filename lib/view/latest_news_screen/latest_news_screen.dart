import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:noviindus_task_2/view/each_news_screen/each_news_screen.dart';

import '../all_news_screen.dart/widgets/custom_news_tile_widget.dart';
import '../const/const.dart';

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
            return CustomNewsTailWidgets(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EachNewsScreen(),
                ),
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
