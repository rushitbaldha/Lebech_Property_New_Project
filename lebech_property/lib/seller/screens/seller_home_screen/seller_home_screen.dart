import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/common/custom_drawer/seller_drawer/seller_drawer.dart';
import 'package:lebech_property/seller/controllers/seller_home_screen_controller/seller_home_screen_controller.dart';

class SellerHomeScreen extends StatelessWidget {
  SellerHomeScreen({Key? key}) : super(key: key);
  final sellerHomeScreenController = Get.put(SellerHomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Lebech Property'),
      ),

      drawer: SellerDrawer(),



    );
  }
}
