import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noviindus_task_2/presentation/core/const.dart';

import '../../widgets/custom_news_tile_widget.dart';

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
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.03,),
              child: CustomNewsTailWidgets(
                height: 0.28,
              ),
            ),
            Container(
              height: 40,
              width: double.infinity,
              color: Color.fromARGB(255, 217, 215, 215),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  child: Text(
                    'Updated: Jul 21, 2022 07:22 AM',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: appLebelColor),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
              child: const Text(
                dummyText,
                // maxLines: 2,
                style: TextStyle(
                  fontSize: 14,
                  color: appBlack,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
