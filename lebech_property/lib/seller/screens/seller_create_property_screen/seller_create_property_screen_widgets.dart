import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';
import 'package:lebech_property/seller/controllers/seller_create_property_screen_controller/seller_create_property_screen_controller.dart';

import 'pg_module.dart';
import 'rent_module.dart';
import 'sale_module.dart';

class SCPPropertyDetailsModule extends StatelessWidget {
  SCPPropertyDetailsModule({Key? key}) : super(key: key);
  final screenController = Get.find<SellerCreatePropertyScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Property Detail",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Divider(thickness: 2, color: Colors.grey.shade600),
          const Header1(text: "Property Details"),
          const Header2(text: "Property For"),
          PropertyForDropdownModule(),

          // If Sale Part Select then show this modules
          Obx(
            () => screenController.propertyForValue.value == screenController.propertyForList[0]
                ? SalePropertyDetailsModule()
                : screenController.propertyForValue.value == screenController.propertyForList[1]
                    ? RentPropertyDetailsModule()
                    : PgPropertyDetailsModule(),
          ),
        ],
      ).commonAllSidePadding(padding: 3),
    ).commonAllSidePadding(padding: 8);
  }
}

class PropertyForDropdownModule extends StatelessWidget {
  PropertyForDropdownModule({Key? key}) : super(key: key);
  final screenController = Get.find<SellerCreatePropertyScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      width: Get.width, //gives the width of the dropdown button
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        border: Border.all(),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
          buttonTheme: ButtonTheme.of(context).copyWith(
            alignedDropdown: true,
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: screenController.propertyForValue.value,
            items: screenController.propertyForList
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(color: Colors.black),
                ),
              );
            }).toList(),
            onChanged: (value) {
              screenController.isLoading(true);
              screenController.propertyForValue.value = value!;
              screenController.isLoading(false);
            },
          ),
        ),
      ),
    );
  }
}




