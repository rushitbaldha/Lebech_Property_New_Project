import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lebech_property/common/constants/api_header.dart';
import '../../common/constants/api_url.dart';

class ContactListScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

  List contactsList = [];

  Future<void> contactListFunction() async {
    isLoading(true);
    String url = ApiUrl.contactListApi;

    try {
      http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
      log("Contact List Api Response : ${response.body}");




    } catch(e) {
      log("contactListFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }


  @override
  void onInit() {
    contactListFunction();
    super.onInit();
  }

}