import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceData {
  String isUserLoggedInKey = 'isUserLoggedInKey';
  String userTokenKey = 'userTokenKey';

  setUserLoggedInDetailsInPrefs({required String userToken}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isUserLoggedInKey, true);
    prefs.setString(userTokenKey, userToken);

    log('isUserLoggedInKey : ${prefs.getBool(isUserLoggedInKey)}');
    log('userTokenKey : ${prefs.getString(userTokenKey)}');
  }

}