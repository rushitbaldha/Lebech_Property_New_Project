import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:lebech_property/common/constants/api_url.dart';
import 'package:http/http.dart' as http;
import '../models/search_result_model/search_result_model.dart';



class ExtraScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;


  /// Category Wise Property Function - Done
  /*getCategoryWisePropertyFunction() async {
    isLoading(true);
    String url = ApiUrl.getCategoryWisePropertyApi;
    log("Category Wise Property URL : $url");

    try{
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields['id'] = "1";
      request.fields['status'] = "rent";
      request.fields['city'] = "1";
      var response = await request.send();


      response.stream.transform(utf8.decoder).listen((value) async {
        CategoryPropertyModel categoryPropertyModel = CategoryPropertyModel.fromJson(json.decode(value));
        isSuccessStatus = categoryPropertyModel.status.obs;
        log("isSuccessStatus : $isSuccessStatus");

        if(isSuccessStatus.value) {
         log("isSuccessStatus : $isSuccessStatus");
         log("getCategoryWisePropertyFunction Complete Done!!!!!!!!!");
        } else {
          log("getCategoryWisePropertyFunction Else Else");
        }

      });

    } catch(e) {
      log("getCategoryWisePropertyFunction Error :: $e");
    } finally {
      isLoading(false);
    }

  }*/


  /// Change City Function - Done
  /*changeCityFunction() async {
    isLoading(true);
    String url = ApiUrl.changeCityApi;
    log("Change City Api URL : $url");

    try{
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields['id'] = "2";
      var response = await request.send();
      log("Fields ::: ${request.fields}");


      response.stream.transform(utf8.decoder).listen((value) async {
        ChangeCityModel changeCityModel = ChangeCityModel.fromJson(json.decode(value));
        isSuccessStatus = changeCityModel.status.obs;
        log("isSuccessStatus : $isSuccessStatus");

        if(isSuccessStatus.value) {
          log("isSuccessStatus : $isSuccessStatus");
          log("changeCityFunction Complete Done!!!!!!!!!");
        } else {
          log("changeCityFunction Else Else");
        }

      });

    } catch(e) {
      log("changeCityFunction Error :: $e");
    } finally {
      isLoading(false);
    }

  }*/


  /// Direct Search Function - Done
  /*directSearchFunction() async {
    isLoading(true);
    String url = ApiUrl.directSearchApi;
    log("Direct Search API URL : $url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields["search"] = "a";
      request.fields["status"] = "rent";
      log("Fields ::: ${request.fields}");

      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async {
        DirectSearchModel directSearchModel = DirectSearchModel.fromJson(json.decode(value));
        isSuccessStatus = directSearchModel.status.obs;
        log("isSuccessStatus : $isSuccessStatus");

        if(isSuccessStatus.value) {
          log("isSuccessStatus : $isSuccessStatus");
          log("directSearchFunction Complete Done!!!!!!!!!");
        } else {
          log("directSearchFunction Else Else");
        }

      });

    } catch(e) {
      log("directSearchFunction Error ::: $e");
    } finally {
      isLoading(false);
    }

  }*/


  /// Fetch Project Function - Done
  /*fetchProjectFunction() async {
    isLoading(true);
    String url = ApiUrl.fetchProjectApi;
    log("Fetch Project API URL : $url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields["city"] = "1";
      request.fields["id"] = "1";
      log("Fields ::: ${request.fields}");

      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async {
        ProjectFetchModel projectFetchModel = ProjectFetchModel.fromJson(json.decode(value));
        isSuccessStatus = projectFetchModel.status.obs;
        log("isSuccessStatus : $isSuccessStatus");

        if(isSuccessStatus.value) {
          log("isSuccessStatus : $isSuccessStatus");
          log("fetchProjectFunction Complete Done!!!!!!!!!");
        } else {
          log("fetchProjectFunction Else Else");
        }

      });

    } catch(e) {
      log("fetchProjectFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }*/


  /// Search Result Function - Done
  searchResultFunction() async {
    isLoading(true);
    String url = ApiUrl.searchResultApi;
    log("Search Result  Api URL : $url");

    try{
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields["city"] = "1";
      request.fields["search"] = "a";
      request.fields["status"] = "rent";
      request.fields["type"] = "1";
      log("Fields ::: ${request.fields}");

      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async {
        SearchResultModel searchResultModel = SearchResultModel.fromJson(json.decode(value));
        isSuccessStatus = searchResultModel.status.obs;
        log("isSuccessStatus : $isSuccessStatus");

        if(isSuccessStatus.value) {
          log("isSuccessStatus : $isSuccessStatus");
          log("searchResultFunction Complete Done!!!!!!!!!");
        } else {
          log("searchResultFunction Else Else");
        }

      });

    } catch(e) {
      log("searchResultFunction Error :: $e");
    } finally {
      isLoading(false);
    }

  }


  @override
  void onInit() {
    searchResultFunction();
    super.onInit();
  }


}