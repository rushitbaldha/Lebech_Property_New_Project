import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../common/constants/api_url.dart';
import '../../models/home_screen_model/home_screen_model.dart';
import '../../models/search_result_model/search_result_model.dart';

class SearchScreenController extends GetxController {
  /// List From Home Screen - DD
  List<HomePropertyType> propertyTypeList = Get.arguments;
  HomePropertyType propertyTypeValue = HomePropertyType();

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  RxString propertyStatusValue = 'Property Status'.obs;
  // RxString propertyTypeValue = 'Property Type'.obs;
  RxString cityName = "Choose City".obs;

  TextEditingController searchFieldController = TextEditingController();
  List<SearchDatum> searchList = [];


  /// Search Result Function
  searchResultFunction({required String searchText}) async {
    isLoading(true);
    String url = ApiUrl.searchResultApi;
    log("Search Result  Api URL : $url");

    try{
      var request = http.MultipartRequest('POST', Uri.parse(url));
      // request.fields["city"] = "1";
      // request.fields["search"] = "a";
      // request.fields["status"] = "rent";
      // request.fields["type"] = "1";


      request.fields["city"] = "1";
      request.fields["search"] = searchText.toString();
      request.fields["status"] = propertyTypeValue.name!;
      request.fields["type"] = "1";

      log("Fields ::: ${request.fields}");

      var response = await request.send();

      response.stream.transform(const Utf8Decoder()).transform(const LineSplitter()).listen((dataLine) {
        SearchResultModel searchResultModel = SearchResultModel.fromJson(json.decode(dataLine));
        isSuccessStatus = searchResultModel.status.obs;
        log("isSuccessStatus : $isSuccessStatus");

        if(isSuccessStatus.value) {
          searchList = searchResultModel.data.data;

          log("searchList Length : ${searchList.length}");
          loadUI();
        } else {
          log("searchResultFunction Else Else");
        }

        });

      /*response.stream.transform(utf8.decoder).listen((value) async {
        SearchResultModel searchResultModel = SearchResultModel.fromJson(json.decode(value));
        isSuccessStatus = searchResultModel.status.obs;
        log("isSuccessStatus : $isSuccessStatus");

        if(isSuccessStatus.value) {
          // searchList = searchResultModel.data.data;
          // searchList.clear();
          // searchList.addAll(searchResultModel.data.data);
          log("searchList Length : ${searchList.length}");
        } else {
          log("searchResultFunction Else Else");
        }

      });*/

    } catch(e) {
      log("searchResultFunction Error :: $e");
    } finally {
      isLoading(false);
    }

  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }

  @override
  void onInit() {
    propertyTypeList.insert(0, HomePropertyType(name: "Property Type"));
    propertyTypeValue = propertyTypeList[0];
    super.onInit();
  }

}
