import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/sign_up_screen_controller/sign_up_screen_controller.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final signUpScreenController = Get.put(SignUpScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
