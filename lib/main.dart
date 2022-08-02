import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techtest/constant.dart';

import 'screens/main/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.quicksandTextTheme(),
        appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(
            color: Colors.white, //change your color here
          ),
          titleTextStyle: GoogleFonts.quicksand(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
        ),
        primarySwatch: primarySwatchColor,
      ),
      home: const MainScreen(),
    );
  }
}
