import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/seller/controllers/seller_home_screen_controller/seller_home_screen_controller.dart';

class SellerHomeScreen extends StatelessWidget {
  SellerHomeScreen({Key? key}) : super(key: key);
  final sellerHomeScreenController = Get.put(SellerHomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
