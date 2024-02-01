import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:noviindus_task_2/view/const/const.dart';
import 'package:noviindus_task_2/view/each_news_screen/each_news_screen.dart';

import '../latest_news_screen/latest_news_screen.dart';
import 'widgets/custom_news_tile_widget.dart';
import 'widgets/read_more.dart';

class AllNews extends StatelessWidget {
  const AllNews({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height * 0.38,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: appLebelColor,
            image: DecorationImage(
                image: NetworkImage(
                  dummyImage1,
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
        ),
      ],
    );
  }
}
