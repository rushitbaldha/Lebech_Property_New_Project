import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class ExtraScreen extends StatelessWidget {
  ExtraScreen({Key? key}) : super(key: key);
  final extraScreenController = Get.put(ExtraScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
