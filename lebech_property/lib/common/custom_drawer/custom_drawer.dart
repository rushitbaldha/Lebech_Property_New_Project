import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';
import 'package:lebech_property/screens/sign_in_screen/sign_in_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Get.back();
                Get.to(
                  () => SignInScreen(),
                  transition: Transition.leftToRight,
                );
              },
              child: Row(
                children: const [
                  Icon(
                    Icons.logout_rounded,
                    size: 25,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Sign Out",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ).commonAllSidePadding(padding: 10),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
