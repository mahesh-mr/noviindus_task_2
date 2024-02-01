import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:noviindus_task_2/view/const/const.dart';

import '../all_news_screen.dart/all_news_screen.dart';
import '../tabs/tab_1.dart';
import '../tabs/tab_2.dart';
import '../tabs/tab_3.dart';
import '../tabs/tab_4.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: NestedScrollView(
          headerSliverBuilder: (context, index) {
            return [
              const SliverAppBar(
                title: Text('Nwes & Blogs'),
                elevation: 0,
                foregroundColor: appBlack,
                bottom: TabBar(
                  unselectedLabelColor: appBlack,
                  indicatorColor: appBlack,
                  labelColor: appLebelColor,
                  tabs: [
                    Tab(
                      text: 'tab_1',
                    ),
                    Tab(
                      text: 'tab_2',
                    ),
                    Tab(
                      text: 'tab_3',
                    ),
                    Tab(
                      text: 'tab_4',
                    ),
                  ],
                ),
              )
            ];
          },
          body: const TabBarView(
            children: [
              AllNews(),
              Tab2(),
              Tab3(),
              Tab4(),
            ],
          ),
        ),
      ),
    );
  }
}
