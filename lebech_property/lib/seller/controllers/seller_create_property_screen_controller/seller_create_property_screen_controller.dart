import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:lebech_property/common/constants/api_url.dart';
import 'package:lebech_property/common/constants/enums.dart';
import 'package:lebech_property/seller/models/seller_create_property_screen_model/form_basic_details_model.dart';
import 'package:lebech_property/seller/models/seller_create_property_screen_model/property_features_checkbox_model.dart';

class SellerCreatePropertyScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  RxList<String> propertyForList = ["Sale", "Rent/Lease", "PG/Hostel"].obs;
  RxString propertyForValue = "Sale".obs;

  List<String> propertyNameList = [];
  String propertyNameValue = "";

  List<Property> propertyTypeList = [];
  Property propertyTypeValue = Property();

  List<BasicCity> cityList = [];
  BasicCity cityValue = BasicCity(name: "Select City");

  List<BasicArea> areaList = [];
  BasicArea areaValue = BasicArea(name: "Select Area");

  List<BasicState> stateList = [];
  BasicState stateValue = BasicState(name: "Select State");

  List<int> bedRoomList = [1,2,3,4,5,6,7,8,9,10];
  int bedRoomValue = 1;

  List<int> intList = [0,1,2,3,4,5,6,7,8,9,10];
  int balconiesValue = 0;
  int bathRoomsValue = 0;
  int acValue = 0;
  int bedValue = 0;
  int wardrobeValue = 0;
  int tvValue = 0;
  RxBool isWithoutHall = false.obs;
  RxBool isNegotiable = false.obs;

  List<String> furnishedList = ["Furnished", "Unfurnished", "Semi-Furnished"];
  RxString furnishedValue = "Furnished".obs;

  List<FeatureCheckboxModel> featuresCheckboxList = [
    FeatureCheckboxModel(name: "Fridge", value: false),
    FeatureCheckboxModel(name: "Sofa", value: false),
    FeatureCheckboxModel(name: "Washing Machine", value: false),
    FeatureCheckboxModel(name: "Dining Table", value: false),
    FeatureCheckboxModel(name: "Microwave", value: false),
    FeatureCheckboxModel(name: "Gas Connection", value: false),
  ];

  TextEditingController propertyNameController = TextEditingController();
  TextEditingController propertySortDescController = TextEditingController();
  TextEditingController floorNoController = TextEditingController();
  TextEditingController totalFloorController = TextEditingController();
  TextEditingController superAreaController = TextEditingController();
  TextEditingController carpetAreaController = TextEditingController();
  TextEditingController liftsInTowerController = TextEditingController();
  TextEditingController unitsOnFloorController = TextEditingController();
  TextEditingController salePriceController = TextEditingController();
  TextEditingController loanAmountController = TextEditingController();
  TextEditingController perSqFtRateController = TextEditingController();

  PropertyAvailability propertyAvailability = PropertyAvailability.immediately;
  SeparateCleaningArea separateCleaningArea = SeparateCleaningArea.none;

  List<String> ageOfConstructionList = [
    "1 to 3 Year",
    "3 to 5 Year",
    "5 to 7 Year",
    "7 to 10 Year",
    "10 to 15 Year",
    "15 to 20 Year",
    "More then 20 Year",
  ];
  String ageOfConstructionValue = "1 to 3 Year";

  DateTime selectedDate = DateTime.now();



  /// Get Form Details From Api
  Future<void> getFormDetailsFunction() async {
    isLoading(true);
    String url = ApiUrl.basicDetailsApi;
    log("Basic Details Api Url : $url");

    try {
      http.Response response = await http.post(Uri.parse(url));
      log("getFormDetailsFunction Response : ${response.body}");

      FormBasicDetailsModel formBasicDetailsModel = FormBasicDetailsModel.fromJson(json.decode(response.body));
      log("formBasicDetailsModel : ${formBasicDetailsModel.data}");
      isSuccessStatus = formBasicDetailsModel.status.obs;

      if(isSuccessStatus.value) {
        propertyNameList.clear();
        propertyNameList = formBasicDetailsModel.data.name;

        propertyTypeList = formBasicDetailsModel.data.property;
        propertyTypeValue = propertyTypeList[0];

        cityList.addAll(formBasicDetailsModel.data.city);
        cityValue = cityList[0];

        areaList.addAll(formBasicDetailsModel.data.area);
        areaValue =areaList[0];

        stateList.addAll(formBasicDetailsModel.data.state);
        stateValue = stateList[0];

      } else {
        log("getFormDetailsFunction Else Else");
      }

    } catch(e) {
      log("getFormDetailsFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }





  @override
  void onInit() {
    getFormDetailsFunction();
    super.onInit();
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}