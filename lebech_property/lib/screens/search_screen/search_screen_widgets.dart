import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/common/constants/app_colors.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';
import '../../common/field_decorations.dart';
import '../../controllers/search_screen_controller/search_screen_controller.dart';
import '../../models/home_screen_model/home_screen_model.dart';
import '../../models/search_result_model/search_result_model.dart';
import '../property_details_screen/property_details_screen.dart';



/// City List - DD
class SSCityListDropDownModule extends StatelessWidget {
  SSCityListDropDownModule({Key? key}) : super(key: key);
  final screenController = Get.find<SearchScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          ()=> Container(
        padding: const EdgeInsets.only(left: 10),
        width: Get.width, //gives the width of the dropdown button
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
            child: DropdownButton<Cities>(
              value: screenController.citiesTypeValue,
              items: screenController.citiesList.map<DropdownMenuItem<Cities>>((Cities value) {
                return DropdownMenuItem<Cities>(
                  value: value,
                  child: Text(
                    value.name!,
                    style: const TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                screenController.isLoading(true);
                screenController.citiesTypeValue = value!;
                screenController.isLoading(false);
                log("value : $value");
              },
            ),
          ),
        ),
      ),
    );
  }
}


/// Property Status - DD
class SSPropertyStatusDropDownModule extends StatelessWidget {
  SSPropertyStatusDropDownModule({Key? key}) : super(key: key);
  final screenController = Get.find<SearchScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          ()=> Container(
        padding: const EdgeInsets.only(left: 10),
        width: Get.width, //gives the width of the dropdown button
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
              value: screenController.propertyStatusValue.value,
              items: <String>[
                'Property Status',
                'Rent',
                'Sell',
                'PG',
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
                screenController.isLoading(true);
                screenController.propertyStatusValue.value = value!;
                screenController.isLoading(false);
                log("value : $value");
              },
            ),
          ),
        ),
      ),
    );
  }
}

/// Property Type - DD
class SSPropertyTypeDropDownModule extends StatelessWidget {
  SSPropertyTypeDropDownModule({Key? key}) : super(key: key);
  final screenController = Get.find<SearchScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      width: Get.width, //gives the width of the dropdown button
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
          child: DropdownButton<HomePropertyType>(
            value: screenController.propertyTypeValue,
            items: screenController.propertyTypeList
                .map<DropdownMenuItem<HomePropertyType>>((HomePropertyType value) {
              return DropdownMenuItem<HomePropertyType>(
                value: value,
                child: Text(
                  value.name!,
                  style: const TextStyle(color: Colors.black),
                ),
              );
            }).toList(),
            onChanged: (value) {
              screenController.isLoading(true);
              screenController.propertyTypeValue = value!;
              screenController.isLoading(false);
            },
          ),
        ),
      ),
    );
  }
}



/// Search Field
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


/// Find Button
class FindButtonModule extends StatelessWidget {
  FindButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<SearchScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        String searchText = screenController.searchFieldController.text.trim();
        await screenController.searchResultFunction(searchText: searchText);
        /*if(screenController.propertyTypeValue.name == "Property Type") {
          Fluttertoast.showToast(msg: "Please select property type!");
        } else if(screenController.propertyStatusValue.value == "Property Status") {
          Fluttertoast.showToast(msg: "Please select property status!");
        } else {
          await screenController.searchResultFunction(searchText: searchText);
        }*/

      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: AppColors.blueColor,
        ),
        child: const Text(
          "Find",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ).commonSymmetricPadding(horizontal: 30, vertical: 15),
      ),
    );
  }
}


/// Search List
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

