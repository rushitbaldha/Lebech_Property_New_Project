import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/builder/controllers/builder_drawer_controller/builder_drawer_controller.dart';
import 'package:lebech_property/buyer/screens/sign_in_screen/sign_in_screen.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';

class BuilderDrawer extends StatelessWidget {
  BuilderDrawer({Key? key}) : super(key: key);
  final builderDrawerController = Get.put(BuilderDrawerController());

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => builderDrawerController.isLoading.value
          ? const CustomCircularProgressIndicatorModule()
          : Drawer(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    // homeModule(),
                    // profileModule(),
                    createPropertyModule(),
                    // propertyListModule(),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              builderDrawerController.isLoggedIn.value
                  ? signOutButton()
                  : signInButton(),
              const SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }

  Widget createPropertyModule() {
    return ListTile(
      onTap: () {
        Get.back();
        // Get.to(()=> BuilderCreatePropertyScreen(), transition: Transition.leftToRight);
      },
      leading: const Icon(Icons.home_rounded),
      title: const Text(
        "Create Property",
        textAlign: TextAlign.start,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }



  Widget signInButton() {
    return GestureDetector(
      onTap: () {
        Get.back();
        Get.to(
              () => SignInScreen(),
          transition: Transition.leftToRight,
        );
      },
      child: Obx(
            () => builderDrawerController.isLoading.value
            ? const CustomCircularProgressIndicatorModule()
            : Row(
          children: const [
            Icon(Icons.login_rounded, size: 25),
            SizedBox(width: 10),
            Text(
              "Sign In",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ).commonAllSidePadding(padding: 10),
      ),
    );
  }

  Widget signOutButton() {
    return GestureDetector(
      onTap: () {
        builderDrawerController.userLoggedOutFunction();
      },
      child: Obx(
            () => builderDrawerController.isLoading.value
            ? const CustomCircularProgressIndicatorModule()
            : Row(
          children: const [
            Icon(Icons.logout_rounded, size: 25),
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
    );
  }



}
