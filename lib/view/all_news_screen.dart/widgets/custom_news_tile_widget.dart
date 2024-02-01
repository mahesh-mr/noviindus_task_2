import 'package:flutter/material.dart';

import '../../const/const.dart';

class CustomNewsTailWidgets extends StatelessWidget {
  CustomNewsTailWidgets({
    this.height = 0.2,
    this.maxline = 2,
    this.onTap,
    super.key,
  });
VoidCallback? onTap;
  double height;
  int maxline;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
      child: GestureDetector(onTap: onTap,
        child: Column(
          children: [
            Container(
              height: size.height * height,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: const DecorationImage(
                  image: NetworkImage(
                    dummyImage2,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20, right: 20),
                  child: Container(
                    height: size.height * 0.045,
                    width: size.width * 0.2,
                    decoration: BoxDecoration(
                      color: bg,
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Icon(
                          Icons.access_time_filled_outlined,
                        ),
                        Text('20 Min')
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: appBlack,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              dummyText,
              maxLines: maxline,
              style: const TextStyle(
                fontSize: 14,
                color: appBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
