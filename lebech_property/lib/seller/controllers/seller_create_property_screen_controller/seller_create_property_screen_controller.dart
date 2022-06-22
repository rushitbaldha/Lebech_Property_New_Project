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
  TextEditingController totalCarParkingController = TextEditingController();
  TextEditingController coveredCarParkingController = TextEditingController();
  TextEditingController openCarParkingController = TextEditingController();
  TextEditingController tenantRestrictionController = TextEditingController();
  TextEditingController securityFeaturesController = TextEditingController();
  TextEditingController occupantsStayController = TextEditingController();
  TextEditingController landMarkAndNearByController = TextEditingController();

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

  TenantBachelors tenantBachelors = TenantBachelors.none;
  TenantNonVegetarian tenantNonVegetarian = TenantNonVegetarian.none;
  TenantPets tenantPets = TenantPets.none;
  TenantCompanyLease tenantCompanyLease = TenantCompanyLease.none;

  List<FeatureCheckboxModel> additionalRoomsList = [
    FeatureCheckboxModel(name: "Pooja Room", value: false),
    FeatureCheckboxModel(name: "Study", value: false),
    FeatureCheckboxModel(name: "Store", value: false),
    FeatureCheckboxModel(name: "Servant Room", value: false),
  ];

  List<String> facingList = [
    "East",
    "West",
    "North",
    "South",
    "South-East",
    "North-West",
    "North-West",
    "South-West",
  ];
  String facingValue = "East";

  List<FeatureCheckboxModel> overlookingList = [
    FeatureCheckboxModel(name: "Garden/Park", value: false),
    FeatureCheckboxModel(name: "Swimming Pool", value: false),
    FeatureCheckboxModel(name: "Main Road", value: false),
  ];

  RxInt totalCarParking = 0.obs;
  RxInt coveredCarParking = 0.obs;
  RxInt openCarParking = 0.obs;

  List<String> availabilityOfWaterList = [
    "", "24 Hours", "18 to 24 Hour", "12 to 18 Hour", "6 to 12 Hour",
    "3 to 6 Hour", "0 to 3 Hour"
  ];
  String availabilityOfWaterValue = "";
  String availabilityOfElectricityValue = "";

  List<FeatureCheckboxModel> flooringList = [
    FeatureCheckboxModel(name: "Ceramic Tiles", value: false),
    FeatureCheckboxModel(name: "Granite", value: false),
    FeatureCheckboxModel(name: "Marble", value: false),
    FeatureCheckboxModel(name: "Marbonite", value: false),
    FeatureCheckboxModel(name: "Mosaic", value: false),
    FeatureCheckboxModel(name: "Normal Tiles / Kotah Stone", value: false),
    FeatureCheckboxModel(name: "Vitrified", value: false),
    FeatureCheckboxModel(name: "Wooden", value: false),
  ];

  List<FeatureCheckboxModel> aminitiesList = [
    FeatureCheckboxModel(name: "Gymnasium", value: false),
    FeatureCheckboxModel(name: "Joggng & Strolling Track", value: false),
    FeatureCheckboxModel(name: "Lift", value: false),
    FeatureCheckboxModel(name: "Piped Gas", value: false),
    FeatureCheckboxModel(name: "Power Backup", value: false),
    FeatureCheckboxModel(name: "Reserved Parking", value: false),
    FeatureCheckboxModel(name: "Security", value: false),
    FeatureCheckboxModel(name: "Swimming Pool", value: false),
  ];

  VisitorsRestriction visitorsRestriction = VisitorsRestriction.none;

  List<FeatureCheckboxModel> preferTenantList = [
    FeatureCheckboxModel(name: "Businessman", value: false),
    FeatureCheckboxModel(name: "Self Employed", value: false),
    FeatureCheckboxModel(name: "Salaried", value: false),
    FeatureCheckboxModel(name: "Goverment Emp.", value: false),
    FeatureCheckboxModel(name: "Retired Emp.", value: false),
    FeatureCheckboxModel(name: "No Preference", value: false),
  ];

  RxBool isAnyTime = false.obs;
  PreferredDayCall preferredDayCall = PreferredDayCall.none;

  List<String> timeList = [ "",
    "7 AM", "8 AM", "9 AM", "10 AM", "11 AM", "12 PM", "1 PM", "2 PM", "3 PM",
    "4 PM", "5 PM", "6 PM", "7 PM", "8 PM", "9 PM", "10 PM",
  ];
  String fromTimeValue = "";
  String toTimeValue = "";

  CrossViolation crossViolation = CrossViolation.none;
  CommonWall commonWall = CommonWall.none;
  RxBool isTermAndCondition = false.obs;





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