import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:lebech_property/common/constants/api_url.dart';
import 'package:http/http.dart' as http;

import '../../models/project_list_model/project_list_model.dart';


class ProjectListScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  List<Datum> projectLists = [];


  getProjectListFunction() async {
    isLoading(true);
    String url = ApiUrl.projectListApi;
    log("URL : $url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.fields['city'] = "1";

      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async {
        ProjectListModel projectListModel = ProjectListModel.fromJson(json.decode(value));
        isSuccessStatus = projectListModel.status.obs;
        log("isSuccessStatus : $isSuccessStatus");

        if(isSuccessStatus.value) {
          projectLists.addAll(projectListModel.data.data);
          log("projectLists : $projectLists");
        } else {
          log("getProjectListFunction Else Else");
        }
        
      });

    } catch(e) {
      log("getProjectListFunction Error : $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getProjectListFunction();
    super.onInit();
  }

}