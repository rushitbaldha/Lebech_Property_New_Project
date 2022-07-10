import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/seller/controllers/add_property_image_screen_controller/add_property_image_screen_controller.dart';

import 'add_property_image_screen_widgets.dart';


class AddPropertyImageScreen extends StatelessWidget {
  AddPropertyImageScreen({Key? key}) : super(key: key);
  final addPropertyImageScreenController = Get.put(AddPropertyImageScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(addPropertyImageScreenController.propertyTitle),
        centerTitle: true,
      ),
      body: Obx(
          () => addPropertyImageScreenController.isLoading.value
              ? const CustomCircularProgressIndicatorModule()
              : Column(
            children: [
              ImageUploadModule(),
            ],
          ),
      ),
    );
  }
}
