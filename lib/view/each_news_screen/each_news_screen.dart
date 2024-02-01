import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noviindus_task_2/view/const/const.dart';

import '../all_news_screen.dart/widgets/custom_news_tile_widget.dart';

class EachNewsScreen extends StatelessWidget {
  const EachNewsScreen({super.key});

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
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: size.height * 0.03),
          child: CustomNewsTailWidgets(
            height: 0.28,
            maxline: 30,
          ),
        ),
      ),
    );
  }
}
