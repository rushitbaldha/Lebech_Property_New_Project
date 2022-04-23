import 'dart:developer';

import 'package:get/get.dart';
import 'package:lebech_property/common/user_details/user_details.dart';
import 'package:lebech_property/screens/home_screen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/sharedpreference_data/sharedpreference_data.dart';

class SplashScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  SharedPreferenceData sharedPreferenceData = SharedPreferenceData();


  goToNextScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    UserDetails.userLoggedIn = prefs.getBool(sharedPreferenceData.isUserLoggedInKey) ?? false;
    UserDetails.userToken = prefs.getString(sharedPreferenceData.userTokenKey) ?? "";
    UserDetails.userCity = prefs.getString(sharedPreferenceData.currentCityKey) ?? "";

    log("userLoggedIn ::: ${UserDetails.userLoggedIn}");
    log("userToken ::: ${UserDetails.userToken}");
    log("userCity ::: ${UserDetails.userCity}");

    Get.offAll(()=> HomeScreen());
  }

  @override
  void onInit() {
    goToNextScreen();
    super.onInit();
  }

}