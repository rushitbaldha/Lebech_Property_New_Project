import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';
import 'package:lebech_property/screens/direct_search_screen/direct_search_screen.dart';
import 'package:lebech_property/screens/sign_in_screen/sign_in_screen.dart';

import '../../controllers/custom_drawer_controller/custom_drawer_controller.dart';


class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}
class _CustomDrawerState extends State<CustomDrawer> {
  CustomDrawerController customDrawerController = Get.put(CustomDrawerController());


  @override
  void initState() {
    customDrawerController.getUserLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
        () => customDrawerController.isLoading.value
            ? const CustomCircularProgressIndicatorModule()
            : Drawer(
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                          Get.to(() => DirectSearchScreen());
                        },
                        child: const Text(
                          "Direct Search",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                customDrawerController.isLoggedIn.value
                    ? signOutButton()
                    : signInButton(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
    );
  }


  signInButton() {
    return GestureDetector(
      onTap: () {
        Get.back();
        Get.to(
          () => SignInScreen(),
          transition: Transition.leftToRight,
        );
      },
      child: Obx(
        () => customDrawerController.isLoading.value
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

  signOutButton() {
    return GestureDetector(
      onTap: () {
        customDrawerController.userLoggedOutFunction();
      },
      child: Obx(
        () => customDrawerController.isLoading.value
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






// class CustomDrawer extends StatelessWidget {
//   CustomDrawer({Key? key}) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       Get.back();
//                       Get.to(() => DirectSearchScreen());
//                     },
//                     child: const Text(
//                       "Direct Search",
//                       textAlign: TextAlign.start,
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//             GestureDetector(
//               onTap: () {
//                 if(customDrawerController.isLoggedIn.value == true) {
//
//                 } else if(customDrawerController.isLoggedIn.value == false) {
//                   Get.back();
//                   Get.to(
//                         () => SignInScreen(),
//                     transition: Transition.leftToRight,
//                   );
//                 }
//
//               },
//               child: Obx(
//                 () => customDrawerController.isLoading.value
//                     ? const CustomCircularProgressIndicatorModule()
//                     : Row(
//                         children: [
//                           customDrawerController.isLoggedIn.value
//                           ? const Icon(Icons.logout_rounded, size: 25)
//                           : const Icon(Icons.login_rounded, size: 25),
//                           const SizedBox(width: 10),
//                           Text(
//                             customDrawerController.isLoggedIn.value
//                             ? "Sign Out"
//                             : "Sign In",
//                             style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18,
//                             ),
//                           ),
//                         ],
//                       ).commonAllSidePadding(padding: 10),
//               ),
//             ),
//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }
