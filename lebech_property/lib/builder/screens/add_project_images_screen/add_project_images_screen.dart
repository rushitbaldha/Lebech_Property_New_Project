import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/builder/controllers/add_project_images_screen_controller/add_project_images_screen_controller.dart';
import 'package:lebech_property/common/common_widgets.dart';

import 'add_project_images_screen_widgets.dart';

class AddProjectImagesScreen extends StatelessWidget {
   AddProjectImagesScreen({Key? key}) : super(key: key);
   final addProjectImagesScreenController = Get.put(AddProjectImagesScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(addProjectImagesScreenController.projectTitle),
        centerTitle: true,
      ),

      body: Obx(
            () => addProjectImagesScreenController.isLoading.value
            ? const CustomCircularProgressIndicatorModule()
            : Column(
          children: [
            ProjectImageUploadModule(),
          ],
        ),
      ),
    );
  }
}
