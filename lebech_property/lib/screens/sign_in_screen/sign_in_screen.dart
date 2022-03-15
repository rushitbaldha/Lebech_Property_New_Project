import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/sign_in_screen_controller/sign_in_screen_controller.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  final signInScreenController = Get.put(SignInScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
