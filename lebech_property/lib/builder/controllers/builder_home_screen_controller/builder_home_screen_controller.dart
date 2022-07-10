import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:lebech_property/common/constants/api_header.dart';
import 'package:lebech_property/common/constants/api_url.dart';
import 'package:lebech_property/seller/models/seller_home_screen_models/property_list_model.dart';

class BuilderHomeScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();
  List<SellerPropertyDatum> builderPropertyList = [];




  /// Get Seller All Property
  Future<void> getSellerAllPropertyFunction() async {
    isLoading(true);
    String url = ApiUrl.getBuilderAllPropertyApi;
    log("Get All Property Api Url : $url");

    try {
      http.Response response = await http.post(Uri.parse(url), headers: apiHeader.sellerHeader);
      // log("response : ${response.body}");

      PropertyListModule propertyListModule = PropertyListModule.fromJson(json.decode(response.body));
      isSuccessStatus = propertyListModule.status.obs;
      log("isSuccessStatus : $isSuccessStatus");

      if(isSuccessStatus.value) {
        builderPropertyList.clear();
        builderPropertyList.addAll(propertyListModule.data.data);
        log("sellerPropertyList : ${builderPropertyList.length}");
      } else {
        log("Get All Property Else Else");
      }

    } catch(e) {
      log("Get All Property Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getSellerAllPropertyFunction();
    super.onInit();
  }


}