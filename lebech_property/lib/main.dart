import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'common/app_theme/app_theme.dart';
import 'screens/splash_screen/splash_screen.dart';

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

      theme: appThemeData(),

      home: SplashScreen(),
    );
  }
}
