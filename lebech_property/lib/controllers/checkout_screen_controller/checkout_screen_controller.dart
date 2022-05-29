import 'dart:developer';

import 'package:get/get.dart';

class CheckoutScreenController extends GetxController {
  /// From Buy Owner Number Module
  int id = Get.arguments[0] ?? 0;
  String img = Get.arguments[1] ?? "";
  String name = Get.arguments[2] ?? "";
  int price = Get.arguments[3] ?? 0;

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;


  @override
  void onInit() {
    log("id : $id");
    log("img : $img");
    log("name : $name");
    log("price : $price");
    super.onInit();
  }

}