import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/screens/sign_in_screen/sign_in_screen.dart';

import 'common/app_theme/app_theme.dart';
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

      home: SignInScreen(),

      theme: appThemeData(),
    );
  }
}
