import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:lebech_property/common/constants/api_url.dart';
import 'package:http/http.dart' as http;
import '../../models/property_details_model/fact_and_feature_local_model.dart';
import '../../models/property_details_model/fact_number_list_local_model.dart';
import '../../models/property_details_model/property_details_model.dart';
import '../../models/property_details_model/property_list_local_model.dart';

class PropertyDetailsScreenController extends GetxController {
  String propertyId = Get.arguments;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  RxInt activeBannerIndex = 0.obs;
  RxList<PropertyImage> propertyBannerLists = RxList();
  String propertyName = "";
  List<String> aminitiesList = [];
  List<PropertyDetailNameModule> propertyDetailsList = [];
  List<FactNumberListLocalModel> factNumberList = [];
  List<FactAndFeatureModel> factAndFeatureList = [];

  getPropertyDetailsDataFunction() async {
    isLoading(true);
    String url = ApiUrl.propertyDetailsApi;
    log("Url : $url");
    log("Property Id : $propertyId");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.fields["id"] = propertyId;

      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async {
        PropertyDetailsModel propertyDetailsModel =
            PropertyDetailsModel.fromJson(json.decode(value));
        isSuccessStatus = propertyDetailsModel.status.obs;
        log("isSuccessStatus : $isSuccessStatus");

        if (isSuccessStatus.value) {
          propertyBannerLists.clear();
          /// Property Images List Add for Slider
          for (int i = 0;
              i < propertyDetailsModel.data.data.propertyImages.length;
              i++) {
            propertyBannerLists
                .add(propertyDetailsModel.data.data.propertyImages[i]);
          }
          log("propertyBannerLists Length : ${propertyBannerLists.length}");
          propertyName = propertyDetailsModel.data.data.title;
          addAminities(singleItemData: propertyDetailsModel.data.data);
          addPropertyDetails(singleItemData: propertyDetailsModel.data.data);
          addFactNumberList(singleItemData: propertyDetailsModel.data.data);
          addFactAndFeature(singleItemData: propertyDetailsModel.data.data);
        } else {
          log("getPropertyDetailsDataFunction Else Else");
        }
      });
    } catch (e) {
      log("getPropertyDetailsDataFunction Error : $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getPropertyDetailsDataFunction();
    super.onInit();
  }

  addAminities({required DataData singleItemData}) {
    if (singleItemData.propertyTenant.poojaRoom == "true") {
      aminitiesList.add("Pooja Room");
    }
    if (singleItemData.propertyTenant.study == "true") {
      aminitiesList.add("Study");
    }
    if (singleItemData.propertyTenant.store == "true") {
      aminitiesList.add("Store Room");
    }
    if (singleItemData.propertyTenant.servantRoom == "true") {
      aminitiesList.add("Servant Room");
    }
    if (singleItemData.propertyTenant.garden == "true") {
      aminitiesList.add("Garden");
    }
    if (singleItemData.propertyTenant.pool == "true") {
      aminitiesList.add("Pool");
    }
    if (singleItemData.propertyTenant.mainRoad == "true") {
      aminitiesList.add("Main Road");
    }
    if (singleItemData.propertyTenant.ceramicTiles == "true") {
      aminitiesList.add("Ceramic Tiles");
    }
    if (singleItemData.propertyTenant.granite == "true") {
      aminitiesList.add("Granite");
    }
    if (singleItemData.propertyTenant.marble == "true") {
      aminitiesList.add("Marble");
    }
    if (singleItemData.propertyTenant.marbonite == "true") {
      aminitiesList.add("Marbonite");
    }
    if (singleItemData.propertyTenant.mosaic == "true") {
      aminitiesList.add("Mosaic");
    }
    if (singleItemData.propertyTenant.normal == "true") {
      aminitiesList.add("Normal");
    }
    if (singleItemData.propertyTenant.vitrified == "true") {
      aminitiesList.add("Vitrified");
    }
    if (singleItemData.propertyTenant.wooden == "true") {
      aminitiesList.add("Wooden");
    }
    if (singleItemData.propertyTenant.gym == "true") {
      aminitiesList.add("Gym");
    }
    if (singleItemData.propertyTenant.jogging == "true") {
      aminitiesList.add("Jogging");
    }
    if (singleItemData.propertyTenant.liftAvailable == "true") {
      aminitiesList.add("Lift Available");
    }
    if (singleItemData.propertyTenant.pipeGas == "true") {
      aminitiesList.add("Pipe Gas");
    }
    if (singleItemData.propertyTenant.powerBackup == "true") {
      aminitiesList.add("Power Backup");
    }
    if (singleItemData.propertyTenant.reservedParking == "true") {
      aminitiesList.add("Reserved Parking");
    }
    if (singleItemData.propertyTenant.security == "true") {
      aminitiesList.add("Security");
    }
    if (singleItemData.propertyTenant.swimmingPool == "true") {
      aminitiesList.add("Swimming Pool");
    }
  }

  addPropertyDetails({required DataData singleItemData}) {
    propertyDetailsList.add(
      PropertyDetailNameModule(
        propertyName: "Furnished",
        propertyValue: singleItemData.furnished),
    );
    propertyDetailsList.add(
      PropertyDetailNameModule(
          propertyName: "Non Vegetarians",
          propertyValue: singleItemData.propertyTenant.nonVegetarians),
    );
    propertyDetailsList.add(
      PropertyDetailNameModule(
          propertyName: "Facing",
          propertyValue: singleItemData.propertyTenant.facing),
    );
    propertyDetailsList.add(
      PropertyDetailNameModule(
          propertyName: "Water",
          propertyValue: "${singleItemData.propertyTenant.water} Hour"),
    );
    propertyDetailsList.add(
      PropertyDetailNameModule(
          propertyName: "Age",
          propertyValue: singleItemData.age),
    );
    propertyDetailsList.add(
      PropertyDetailNameModule(
          propertyName: "Bachelors",
          propertyValue: singleItemData.propertyTenant.bachelors),
    );
    propertyDetailsList.add(
      PropertyDetailNameModule(
          propertyName: "Pets",
          propertyValue: singleItemData.propertyTenant.pets),
    );
    propertyDetailsList.add(
      PropertyDetailNameModule(
          propertyName: "Total Car Parking",
          propertyValue: singleItemData.propertyTenant.totalCarParking.toString()),
    );
    propertyDetailsList.add(
      PropertyDetailNameModule(
          propertyName: "Covered Car Parking",
          propertyValue: singleItemData.propertyTenant.coveredCarParking.toString()),
    );
    propertyDetailsList.add(
      PropertyDetailNameModule(
          propertyName: "Electricity",
          propertyValue: "${singleItemData.propertyTenant.electricity} Hour"),
    );
    propertyDetailsList.add(
      PropertyDetailNameModule(
          propertyName: "Floor Number",
          propertyValue: singleItemData.floorNumber),
    );
    propertyDetailsList.add(
      PropertyDetailNameModule(
          propertyName: "Total Floor",
          propertyValue: singleItemData.totalFloor),
    );
    propertyDetailsList.add(
      PropertyDetailNameModule(
          propertyName: "Unit On Floor",
          propertyValue: singleItemData.flatFloor),
    );
  }

  addFactNumberList({required DataData singleItemData}) {
    factNumberList.add(
        FactNumberListLocalModel(
          factName: "Carpet Area",
          factValue: singleItemData.carpetArea)
    );
    factNumberList.add(
        FactNumberListLocalModel(
            factName: "Super Area",
            factValue: singleItemData.superArea)
    );
    factNumberList.add(
        FactNumberListLocalModel(
            factName: "Construction Age",
            factValue: "${singleItemData.age} Year")
    );
    factNumberList.add(
        FactNumberListLocalModel(
            factName: "Sale Price",
            factValue: singleItemData.rent.rent.toString())
    );
    factNumberList.add(
        FactNumberListLocalModel(
            factName: "Loan Amount",
            factValue: "₹")
    );
  }

  addFactAndFeature({required DataData singleItemData}) {
    factAndFeatureList.add(
        FactAndFeatureModel(
          name: "Bedroom",
          value: singleItemData.bedrooms),
    );
    factAndFeatureList.add(
      FactAndFeatureModel(
          name: "Balconies",
          value: singleItemData.balconies),
    );
    factAndFeatureList.add(
      FactAndFeatureModel(
          name: "Bathroom",
          value: singleItemData.bathrooms),
    );
    factAndFeatureList.add(
      FactAndFeatureModel(
          name: "Lift",
          value: singleItemData.lift),
    );
  }
}
