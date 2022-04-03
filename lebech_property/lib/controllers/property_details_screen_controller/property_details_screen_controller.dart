import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:lebech_property/common/constants/api_url.dart';
import 'package:http/http.dart' as http;
import '../../models/property_details_model/property_details_model.dart';

class PropertyDetailsScreenController extends GetxController {
  String propertyId = Get.arguments;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  RxInt activeBannerIndex = 0.obs;
  RxList<String> propertyBannerLists = RxList();

  getPropertyDetailsDataFunction() async {
    isLoading(true);
    String url = ApiUrl.propertyDetailsApi;
    log("Url : $url");
    log("Property Id : $propertyId");

    try{
      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.fields["id"] = propertyId;

      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async {
        PropertyDetailsModel propertyDetailsModel = PropertyDetailsModel.fromJson(json.decode(value));
        isSuccessStatus = propertyDetailsModel.status.obs;
        log("isSuccessStatus : $isSuccessStatus");


        if(isSuccessStatus.value) {

          /// Property Images List Add for Slider
          for(int i =0; i <propertyDetailsModel.data.data.propertyImages.length; i++) {
            propertyBannerLists.add(propertyDetailsModel.data.data.propertyImages[i].image);
          }

        } else {
          log("getPropertyDetailsDataFunction Else Else");
        }

      });


    } catch(e) {
      log("getPropertyDetailsDataFunction Error : $e");
    } finally {
      isLoading(false);
    }

  }

  @override
  void onInit() {
    getPropertyDetailsDataFunction();
    // propertyBannerLists = [
    //   (AppImages.banner1Img),
    //   (AppImages.banner2Img),
    //   (AppImages.banner1Img),
    //   (AppImages.banner2Img),
    //   (AppImages.banner2Img),
    //   (AppImages.banner2Img),
    //   (AppImages.banner2Img),
    //   (AppImages.banner2Img),
    //   (AppImages.banner2Img),
    //   (AppImages.banner2Img),
    //   (AppImages.banner2Img),
    //   (AppImages.banner2Img),
    //   (AppImages.banner2Img),
    //   (AppImages.banner2Img),
    //   (AppImages.banner2Img),
    //   (AppImages.banner2Img),
    // ].obs;
    super.onInit();
  }
}