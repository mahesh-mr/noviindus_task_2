import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'view/const/const.dart';
import 'view/each_news_screen/each_news_screen.dart';
import 'view/home_screen/home_screen.dart';
import 'view/latest_news_screen/latest_news_screen.dart';

void main() {
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
      home: const HomeScreen(),
    );
  }
}
