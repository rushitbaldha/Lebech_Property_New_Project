import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lebech_property/common/constants/app_colors.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';
import 'package:lebech_property/seller/controllers/add_property_image_screen_controller/add_property_image_screen_controller.dart';

class ImageUploadModule extends StatelessWidget {
  ImageUploadModule({Key? key}) : super(key: key);
  final screenController = Get.find<AddPropertyImageScreenController>();
  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Images",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 10),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () async {
                await selectImages();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(),
                ),
                child: const Text(
                    "Choose File"
                ).commonAllSidePadding(padding: 15),
              ),
            ),
            const SizedBox(width: 8),

            screenController.imageFileList.isNotEmpty
            ? Text(
              "${screenController.imageFileList.length} files selected"
            )
                : const Text("No file Chosen"),
          ],
        ),
        const SizedBox(height: 10),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () async {
                await screenController.addPropertyImagesFunction();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  // border: Border.all(),
                  color: AppColors.blueColor,
                ),
                child: const Text(
                  "Upload",
                  style: TextStyle(color: Colors.white),
                ).commonAllSidePadding(padding: 15),
              ),
            ),
          ],
        ),
      ],
    ).commonAllSidePadding(padding: 10);
  }


  // Select Multiple Images From Gallery
  selectImages() async {
    screenController.isLoading(true);
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    for(int i =0; i< selectedImages!.length; i++){
      screenController.imageFileList.add(selectedImages[i]);
    }
    screenController.isLoading(false);
    log("Images Length : ${screenController.imageFileList.length}");
  }

}


class ImagesGridViewModule extends StatelessWidget {
  ImagesGridViewModule({Key? key}) : super(key: key);
  final screenController = Get.find<AddPropertyImageScreenController>();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: screenController.apiImagesList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, i) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(screenController.apiImagesList[i].image),
              fit: BoxFit.cover,
            )
          ),
        );
      },
    ).commonAllSidePadding(padding: 10);
  }
}
