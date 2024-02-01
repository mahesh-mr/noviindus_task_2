import 'package:flutter/material.dart';

import '../../const/const.dart';

class ReadMoreWidget extends StatelessWidget {
  const ReadMoreWidget({
    required this.ontap,
    super.key,
  });
final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
   final size = MediaQuery.of(context).size;
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
      child: SizedBox(
       
        height: 40,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              children: const [
                Icon(
                  Icons.local_fire_department_sharp,
                  color: appOrenge,
                ),
                Text(
                  "Latest News",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                )
              ],
            ),
            TextButton(
                onPressed: ontap,
                child: const Text(
                  'Read more',
                  style: TextStyle(color: appLebelColor),
                ))
          ],
        ),
      ),
    );
  }
}
