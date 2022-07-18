import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:lebech_property/common/constants/api_header.dart';
import 'package:lebech_property/common/constants/api_url.dart';
import 'package:lebech_property/seller/models/seller_home_screen_models/property_list_model.dart';

class BrokerHomeScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();
  List<SellerPropertyDatum> brokerPropertyList = [];


  /// Get Broker All Property
  Future<void> getBrokerAllPropertyFunction() async {
    isLoading(true);
    String url = ApiUrl.getBrokerAllPropertyApi;
    log("Get All Property Api Url : $url");

    try {
      http.Response response = await http.post(Uri.parse(url), headers: apiHeader.sellerHeader);
      // log("response : ${response.body}");

      PropertyListModule propertyListModule = PropertyListModule.fromJson(json.decode(response.body));
      isSuccessStatus = propertyListModule.status.obs;
      log("isSuccessStatus : $isSuccessStatus");

      if(isSuccessStatus.value) {
        brokerPropertyList.clear();
        brokerPropertyList.addAll(propertyListModule.data.data);
        log("brokerPropertyList : ${brokerPropertyList.length}");
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
    getBrokerAllPropertyFunction();
    super.onInit();
  }

}