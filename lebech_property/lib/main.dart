import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Lebech Property New Project",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),

      theme: ThemeData(
        fontFamily: "Quicksand",
        appBarTheme: AppBarTheme(
          color: Colors.red,
          // titleTextStyle: Text
        ),
      ),
    );
  }
}
