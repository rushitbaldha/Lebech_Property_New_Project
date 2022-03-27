import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/custom_appbar/custom_appbar.dart';
import '../../controllers/category_property_screen_controller/category_property_screen_controller.dart';
import 'category_property_screen_widgets.dart';

class CategoryPropertyScreen extends StatelessWidget {
  CategoryPropertyScreen({Key? key}) : super(key: key);
  final categoryPropertyScreenController = Get.put(CategoryPropertyScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Category'),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: 5,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1/2.1,
          ),
          itemBuilder: (context, i){
            return CategoryListTile();
          },
        ),
      ),
    );
  }
}
