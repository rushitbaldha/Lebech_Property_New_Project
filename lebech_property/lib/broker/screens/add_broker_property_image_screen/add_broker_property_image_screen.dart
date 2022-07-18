import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/broker/controllers/add_broker_property_image_screen_controller/add_broker_property_image_screen_controller.dart';
import 'package:lebech_property/common/common_widgets.dart';

import 'add_broker_property_image_screen_widgets.dart';

class AddBrokerPropertyImageScreen extends StatelessWidget {
  AddBrokerPropertyImageScreen({Key? key}) : super(key: key);
  final addBrokerPropertyImageScreenController
  = Get.put(AddBrokerPropertyImageScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(addBrokerPropertyImageScreenController.propertyTitle),
        centerTitle: true,
      ),


      body: Obx(
            () => addBrokerPropertyImageScreenController.isLoading.value
            ? const CustomCircularProgressIndicatorModule()
            : Column(
          children: [
            PropertyImageUploadModule(),
            const SizedBox(height: 10),

            /*addPropertyImageScreenController.apiImagesList.isEmpty
                ? const Center(
              child: Text(
                "No Property Images Available!",
              ),
            )
                : ImagesGridViewModule(),*/

          ],
        ),
      ),

    );
  }
}
