import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lebech_property/common/constants/app_colors.dart';
import 'package:lebech_property/common/constants/app_images.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';
import 'package:lebech_property/seller/controllers/seller_home_screen_controller/seller_home_screen_controller.dart';
import 'package:lebech_property/seller/models/seller_home_screen_models/property_list_model.dart';

class SellerPropertyListModule extends StatelessWidget {
  SellerPropertyListModule({Key? key}) : super(key: key);
  final sellerHomeScreenController = Get.find<SellerHomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sellerHomeScreenController.sellerPropertyList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        SellerPropertyDatum propertySingleItem = sellerHomeScreenController.sellerPropertyList[i];
        return _sellerPropertyListTile(propertySingleItem);
      },
    ).commonAllSidePadding(padding: 10);
  }

  Widget _sellerPropertyListTile(SellerPropertyDatum propertySingleItem) {
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
                child: Container(
                  child: propertySingleItem.propertyImages.isEmpty
                  ? Image.asset(AppImages.banner1Img, fit: BoxFit.cover,)
                  : Image.network(
                    propertySingleItem.propertyImages[0].image,
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
                      propertySingleItem.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      propertySingleItem.city.name,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 5),
                    Text(
                      propertySingleItem.detail,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      "${propertySingleItem.rent.rent} ₹",
                      style: const TextStyle(
                        color: Colors.grey,
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
                        onTap: () {Fluttertoast.showToast(msg: "Clicked On Add Button");},
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
                ),
              ),
            ],
          ),

        ],
      ).commonAllSidePadding(padding: 10),
    ).commonSymmetricPadding(vertical: 8);
  }

}
