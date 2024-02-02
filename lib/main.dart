
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noviindus_task_2/presentation/pages/tabs/tab_1.dart';
import 'presentation/core/const.dart';
import 'presentation/pages/each_news_screen/each_news_screen.dart';
import 'presentation/pages/home_screen/home_screen.dart';
import 'presentation/pages/latest_news_screen/latest_news_screen.dart';

void main()async {
 await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(
            color: appBlack,
          ),
          backgroundColor: bg,
          elevation: 0,
          foregroundColor: appBlack,
          titleTextStyle: GoogleFonts.prompt(
            color: appBlack,
            fontSize: 20,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home:  MyHomePager(),
    );
  }
}
