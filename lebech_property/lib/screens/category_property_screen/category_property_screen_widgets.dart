import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/constants/app_images.dart';
import '../../controllers/category_property_screen_controller/category_property_screen_controller.dart';

class CategoryListTile extends StatelessWidget {
  CategoryListTile({Key? key}) : super(key: key);
  final screenController = Get.find<CategoryPropertyScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Get.to(()=> SubCategoryPropertyScreen());
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 35,
              child: _imageModule(),
            ),
            // const SizedBox(height: 5),
            Expanded(
              flex: 65,
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _priceModule(),
                      const SizedBox(height: 5),
                      _propertyHeadingModule(),
                      const SizedBox(height: 5),
                      _smallDetailsModule(),
                      const SizedBox(height: 5),
                      _placeModule(),
                      const SizedBox(height: 5),
                      _parkingModule(),
                      const SizedBox(height: 5),
                      _visitModule(),
                      const SizedBox(height: 5),
                      _propertyDetails(),
                      const SizedBox(height: 5),
                      // const SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _imageModule() {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
          ),
          image: DecorationImage(
            image: AssetImage(AppImages.banner2Img),
            fit: BoxFit.cover,
          )
      ),
    );
  }

  Widget _priceModule() {
    return const Text(
      '₹ 3.10 CRORE',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: Colors.red,
        fontSize: 18,
      ),
    );
  }

  Widget _propertyHeadingModule() {
    return const Text(
      'RAJHANS ROYALTON',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }

  Widget _smallDetailsModule() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        Text(
          '4BHK',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          '(₹ per sqr.F)',
          style: TextStyle(color: Colors.grey, fontSize: 15),
        ),
      ],
    );
  }

  Widget _placeModule() {
    return const Text(
      '100% vastu (North West)',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(color: Colors.grey),
    );
  }

  Widget _parkingModule() {
    return const Text(
      '3 Car Parking',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: Colors.grey,
      ),
    );
  }

  Widget _visitModule() {
    return const Text(
      'Book a Visit | Buy Owner Number',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.grey,
        fontSize: 15,
      ),
    );
  }

  Widget _propertyDetails() {
    return const Text(
      'Luxurious Living',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey,
      ),
    );
  }

}