import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/seller/controllers/seller_create_property_screen_controller/seller_create_property_screen_controller.dart';
import 'seller_create_property_screen_widgets.dart';



class SellerCreatePropertyScreen extends StatelessWidget {
  SellerCreatePropertyScreen({Key? key}) : super(key: key);
  final sellerCreatePropertyScreenController = Get.put(SellerCreatePropertyScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Create Property'),
      ),


      body: Obx(
          () => sellerCreatePropertyScreenController.isLoading.value
          ? const CustomCircularProgressIndicatorModule()
          : SingleChildScrollView(
            child: Column(
              children: [
                SCPPropertyDetailsModule(),
              ],
            ),
          ),
      ),
    );
  }
}
