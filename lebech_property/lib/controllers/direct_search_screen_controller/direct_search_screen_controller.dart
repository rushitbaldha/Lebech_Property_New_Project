import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../common/constants/api_url.dart';
import '../../models/direct_search_model/direct_search_model.dart';

class DirectSearchScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  List<DirectSearchDatum> directSearchList = [];
  TextEditingController directSearchFieldController = TextEditingController();

  directSearchFunction({required String searchText}) async {
    isLoading(true);
    String url = ApiUrl.directSearchApi;
    log("Direct Search API URL : $url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields["search"] = "a";
      request.fields["status"] = "rent";
      log("Fields ::: ${request.fields}");

      var response = await request.send();

      response.stream.transform(const Utf8Decoder())
          .transform(const LineSplitter())
          .listen((dataLine) {
        DirectSearchModel directSearchModel = DirectSearchModel.fromJson(json.decode(dataLine));
        isSuccessStatus = directSearchModel.status.obs;
        log("isSuccessStatus : $isSuccessStatus");

        if(isSuccessStatus.value) {
          directSearchList = directSearchModel.data.data;
          log("directSearchList Length : ${directSearchList.length}");
        } else {
          log("directSearchFunction Else Else");
        }

      });

      // response.stream.transform(utf8.decoder).listen((value) async {
      //   DirectSearchModel directSearchModel = DirectSearchModel.fromJson(json.decode(value));
      //   isSuccessStatus = directSearchModel.status.obs;
      //   log("isSuccessStatus : $isSuccessStatus");
      //
      //   if(isSuccessStatus.value) {
      //     log("isSuccessStatus : $isSuccessStatus");
      //     log("directSearchFunction Complete Done!!!!!!!!!");
      //   } else {
      //     log("directSearchFunction Else Else");
      //   }
      //
      // });

    } catch(e) {
      log("directSearchFunction Error ::: $e");
    } finally {
      isLoading(false);
    }

  }

}