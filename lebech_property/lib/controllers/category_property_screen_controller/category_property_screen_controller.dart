import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../common/constants/api_url.dart';
import '../../models/category_wise_property_model/category_wise_property_model.dart';

class CategoryPropertyScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  List categoryPropertyList = [];


  getCategoryWisePropertyFunction() async {
    isLoading(true);
    String url = ApiUrl.getCategoryWisePropertyApi;
    log("Category Wise Property URL : $url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields['id'] = "1";
      request.fields['status'] = "rent";
      request.fields['city'] = "1";
      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async {
        CategoryPropertyModel categoryPropertyModel =
            CategoryPropertyModel.fromJson(json.decode(value));
        isSuccessStatus = categoryPropertyModel.status.obs;
        log("isSuccessStatus : $isSuccessStatus");

        if (isSuccessStatus.value) {
          log("isSuccessStatus : $isSuccessStatus");
          log("getCategoryWisePropertyFunction Complete Done!!!!!!!!!");
        } else {
          log("getCategoryWisePropertyFunction Else Else");
        }
      });
    } catch (e) {
      log("getCategoryWisePropertyFunction Error :: $e");
    } finally {
      isLoading(false);
    }
  }



  @override
  void onInit() {
    getCategoryWisePropertyFunction();
    super.onInit();
  }
}