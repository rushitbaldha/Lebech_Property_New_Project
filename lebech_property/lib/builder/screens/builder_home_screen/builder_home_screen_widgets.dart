import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lebech_property/builder/controllers/builder_home_screen_controller/builder_home_screen_controller.dart';
import 'package:lebech_property/builder/models/builder_home_screen_models/project_list_model.dart';
import 'package:lebech_property/builder/screens/add_project_images_screen/add_project_images_screen.dart';
import 'package:lebech_property/common/constants/app_colors.dart';
import 'package:lebech_property/common/constants/app_images.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';


class BuilderProjectListModule extends StatelessWidget {
  BuilderProjectListModule({Key? key}) : super(key: key);
  final builderHomeScreenController = Get.find<BuilderHomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: builderHomeScreenController.builderProjectList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        BuilderProjectDatum propertySingleItem = builderHomeScreenController.builderProjectList[i];
        return _sellerPropertyListTile(propertySingleItem);
      },
    ).commonAllSidePadding(padding: 10);
  }

  Widget _sellerPropertyListTile(BuilderProjectDatum propertySingleItem) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.blueColor),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  propertySingleItem.createdAt,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () { Fluttertoast.showToast(msg: "Clicked On Deactivate Button");},
                  child: const Text(
                    "Deactivate",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: SizedBox(
                  // width: Get.width * 0.35,
                  height: Get.width * 0.35,
                  child: propertySingleItem.images.isEmpty
                      ? Image.asset(AppImages.banner1Img, fit: BoxFit.cover,)
                      : Image.network(
                    propertySingleItem.images[0].img,
                    errorBuilder: (ctx, obj, st) {
                      return Image.asset(AppImages.banner1Img, fit: BoxFit.cover,);
                    },
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      propertySingleItem.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      propertySingleItem.city.name,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),

                    // const SizedBox(height: 5),
                    // Text(
                    //   propertySingleItem.city.name,
                    //   maxLines: 2,
                    //   overflow: TextOverflow.ellipsis,
                    //   style: const TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: 22,
                    //   ),
                    // ),
                    // Text(
                    //   "${propertySingleItem.rent.rent} ₹",
                    //   style: const TextStyle(
                    //     color: Colors.grey,
                    //   ),
                    // ),


                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),

          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    const Text(
                      "Basic Detail  ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Fluttertoast.showToast(msg: "Clicked On Edit Button");
                        },
                        child: const Text(
                          "Edit",
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    const Text(
                      "Images  ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(
                                ()=> AddProjectImagesScreen(),
                            transition: Transition.zoom,
                            arguments: [propertySingleItem.id, propertySingleItem.name],
                          )!.then((value) async {
                            await builderHomeScreenController.getBuilderAllProjectFunction();
                          });
                        },
                        child: const Text(
                          "Edit",
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 5),

          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    const Text(
                      "Other Projects  ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Fluttertoast.showToast(msg: "Clicked On Add Button");
                        },
                        child: const Text(
                          "Edit",
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(),
                /*child: Row(
                  children: [
                    const Text(
                      "Youtube Link  ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          // Get.to(
                          //       ()=> AddPropertyImageScreen(),
                          //   transition: Transition.zoom,
                          //   arguments: [propertySingleItem.id, propertySingleItem.title],
                          // )!.then((value) async {
                          //   await sellerHomeScreenController.getSellerAllPropertyFunction();
                          // });
                        },
                        child: const Text(
                          "Add",
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),*/
              ),
            ],
          ),

        ],
      ).commonAllSidePadding(padding: 10),
    ).commonSymmetricPadding(vertical: 8);
  }

}