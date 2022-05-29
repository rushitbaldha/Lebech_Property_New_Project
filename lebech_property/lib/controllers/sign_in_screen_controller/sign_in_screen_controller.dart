import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../common/constants/api_url.dart';
import '../../common/constants/enums.dart';
import '../../common/sharedpreference_data/sharedpreference_data.dart';
import '../../models/sign_in_model/sign_in_model.dart';
import '../../screens/home_screen/home_screen.dart';

class SignInScreenController extends GetxController {
  /// SignIn Type normal or backScreen
  SignInRouteType signInRouteType = Get.arguments ?? SignInRouteType.normal;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxBool isPasswordShow = true.obs;

  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  final phoneNoTextField = TextEditingController();
  final passwordTextField = TextEditingController();
  SharedPreferenceData sharedPreferenceData = SharedPreferenceData();

  userSignInFunction() async {
    isLoading(true);
    String url = ApiUrl.loginApi;
    log('url : $url');

    try{
      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.fields['mobile'] = phoneNoTextField.text.trim().toLowerCase();
      request.fields['password'] = passwordTextField.text.trim();

      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async {
        SignInModel signInModel = SignInModel.fromJson(json.decode(value));
        isSuccessStatus = signInModel.status.obs;

        if(isSuccessStatus.value) {
          Fluttertoast.showToast(msg: 'User LoggedIn Successfully!');
          String userToken = signInModel.data.token;
          await sharedPreferenceData.setUserLoggedInDetailsInPrefs(userToken: userToken);
          await sharedPreferenceData.setCurrentCityInPrefs(cityId: "1");

          if(signInRouteType == SignInRouteType.normal) {
            Get.offAll(() => HomeScreen());
          } else if(signInRouteType == SignInRouteType.backScreen) {
            Get.back();
          }
        } else {
          Fluttertoast.showToast(msg: 'User Not LoggedIn Successfully!');
        }

      });

    } catch(e) {
      print('userSignInFunction Error1 : $e');
    } finally {
      isLoading(false);
    }
  }

}