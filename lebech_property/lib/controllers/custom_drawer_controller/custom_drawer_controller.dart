import 'dart:developer';

import 'package:get/get.dart';
import 'package:lebech_property/common/user_details/user_details.dart';
import 'package:lebech_property/screens/sign_in_screen/sign_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/sharedpreference_data/sharedpreference_data.dart';

class CustomDrawerController extends GetxController {
  RxBool isLoading = false.obs;
  // RxBool isSuccessStatus = false.obs;
  RxBool isLoggedIn = false.obs;
  SharedPreferenceData sharedPreferenceData = SharedPreferenceData();

  getUserLoggedIn() {
    log("calling getUserLoggedIn Function");
    isLoading(true);
    isLoggedIn = UserDetails.userLoggedIn.obs;
    log("isLoggedIn : $isLoggedIn");
    loadUI();
    isLoading(false);

  }

  userLoggedOutFunction() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(sharedPreferenceData.isUserLoggedInKey, false);
    prefs.setString(sharedPreferenceData.userTokenKey, "");
    prefs.setString(sharedPreferenceData.currentCityKey, "");

    UserDetails.userLoggedIn = prefs.getBool(sharedPreferenceData.isUserLoggedInKey) ?? false;
    UserDetails.userToken = prefs.getString(sharedPreferenceData.userTokenKey) ?? "";
    UserDetails.userCity = prefs.getString(sharedPreferenceData.currentCityKey) ?? "";

    Get.offAll(()=> SignInScreen());
  }

  @override
  void onInit() {
    getUserLoggedIn();
    super.onInit();
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }

}
