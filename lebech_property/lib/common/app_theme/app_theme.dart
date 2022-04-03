import 'package:flutter/material.dart';

ThemeData appThemeData() {
  return ThemeData(
    fontFamily: "Quicksand",

    appBarTheme: const AppBarTheme(
      color: Colors.red,
      centerTitle: true,
      elevation: 0,
      toolbarTextStyle: TextStyle(color: Colors.white),
      // titleTextStyle: Text
    ),

  );
}