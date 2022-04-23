import 'dart:developer';

import 'package:lebech_property/common/user_details/user_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceData {
  String isUserLoggedInKey = 'isUserLoggedInKey';
  String userTokenKey = 'userTokenKey';
  String currentCityKey = "currentCityKey";

  setUserLoggedInDetailsInPrefs({required String userToken}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isUserLoggedInKey, true);
    prefs.setString(userTokenKey, userToken);

    log('isUserLoggedInKey : ${prefs.getBool(isUserLoggedInKey)}');
    log('userTokenKey : ${prefs.getString(userTokenKey)}');

    UserDetails.userLoggedIn = prefs.getBool(isUserLoggedInKey) ?? false;
    UserDetails.userToken = prefs.getString(userTokenKey) ?? "";
    UserDetails.userCity = prefs.getString(currentCityKey) ?? "";
  }

  setCurrentCityInPrefs({required String cityId}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(currentCityKey, cityId);
    log("currentCityKey : ${prefs.getString(currentCityKey)}");
  }

}