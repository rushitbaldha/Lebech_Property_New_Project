import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class ExtraScreen extends StatelessWidget {
  ExtraScreen({Key? key}) : super(key: key);
  final extraScreenController = Get.put(ExtraScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: PropertyTypeDropDownModule(),
        ),
      ),
    );
  }
}

class PropertyTypeDropDownModule extends StatelessWidget {
  PropertyTypeDropDownModule({Key? key}) : super(key: key);
  final extraScreenController = Get.put(ExtraScreenController());

  @override
  Widget build(BuildContext context) {
    return Obx(
          ()=> Container(
        padding: const EdgeInsets.only(left: 10),
        width: MediaQuery.of(context)
            .size
            .width, //gives the width of the dropdown button
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
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
              value: extraScreenController.discountTypeValue.value,
              items: <String>[
                'Rent',
                'Sell',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                extraScreenController.isLoading(true);
                extraScreenController.discountTypeValue.value = value!;
                extraScreenController.isLoading(false);
                log("value : $value");
              },
            ),
          ),
        ),
      ),
    );
  }
}

