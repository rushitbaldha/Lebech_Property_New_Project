import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/field_decorations.dart';
import '../../controllers/search_screen_controller/search_screen_controller.dart';
import '../../models/search_result_model/search_result_model.dart';
import '../property_details_screen/property_details_screen.dart';

class SearchScreenSearchFieldModule extends StatelessWidget {
  SearchScreenSearchFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<SearchScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.searchFieldController,
      keyboardType: TextInputType.text,
      cursorColor: Colors.red,
      decoration: searchFieldDecoration(hintText: 'Search Property', screenController: screenController),
    );
  }
}

class SearchListModule extends StatelessWidget {
  SearchListModule({Key? key}) : super(key: key);
  final screenController = Get.find<SearchScreenController>();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: screenController.searchList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, i){
        SearchDatum singleListingsItem = screenController.searchList[i];
        return GestureDetector(
          onTap: ()=> Get.to(()=> PropertyDetailsScreen(),
            transition: Transition.zoom,
            arguments: singleListingsItem.id.toString(),),

          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 45,
                  child: _imagesListModule(singleListingsItem: singleListingsItem),
                ),
                Expanded(
                  flex: 55,
                  child: _propertyDetailsModule(singleListingsItem: singleListingsItem),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _imagesListModule({required SearchDatum singleListingsItem}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15)
        ),
        image: DecorationImage(
          image: NetworkImage(singleListingsItem.propertyImages[0].image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _propertyDetailsModule({required SearchDatum singleListingsItem}) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            singleListingsItem.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            "₹ ${singleListingsItem.rent.rent}",
            maxLines: 1,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.red,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            singleListingsItem.sortDesc,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 3),
          Text(
            '${singleListingsItem.bedrooms}BHK',
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 3),
          Text(
            '${singleListingsItem.propertyTenant.totalCarParking} Car Parking',
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

}

