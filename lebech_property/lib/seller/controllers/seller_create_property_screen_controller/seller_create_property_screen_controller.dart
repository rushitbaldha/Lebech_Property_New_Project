import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:lebech_property/common/constants/api_header.dart';
import 'package:lebech_property/common/constants/api_url.dart';
import 'package:lebech_property/common/constants/enums.dart';
import 'package:lebech_property/seller/models/seller_create_property_screen_model/create_property_model.dart';
import 'package:lebech_property/seller/models/seller_create_property_screen_model/form_basic_details_model.dart';
import 'package:lebech_property/seller/models/seller_create_property_screen_model/property_features_checkbox_model.dart';

class SellerCreatePropertyScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ApiHeader apiHeader = ApiHeader();

  RxList<String> propertyForList = ["Sale", "Rent/Lease", "PG/Hostel"].obs;
    RxString propertyForValue = "Sale".obs;

  List<String> propertyNameList = [];
  String propertyNameValue = "";

  List<Property> propertyTypeList = [];
  Property propertyTypeValue = Property();
  RxString propertySub = "house".obs;

  List<BasicCity> cityList = [BasicCity(name: "Select City")];
  BasicCity cityValue = BasicCity(name: "Select City");

  List<BasicArea> areaList = [BasicArea(name: "Select Area")];
  BasicArea areaValue = BasicArea(name: "Select Area");

  List<BasicState> stateList = [BasicState(name: "Select State")];
  BasicState stateValue = BasicState(name: "Select State");

  List<int> bedRoomList = [1,2,3,4,5,6,7,8,9,10];
  int bedRoomValue = 1;

  List<int> intList = [0,1,2,3,4,5,6,7,8,9,10];
  List<int> balconiesList = [0,1,2,3,4,5,6,7,8,9,10];
  int balconiesValue = 0;
  int bathRoomsValue = 0;
  int acValue = 0;
  int bedValue = 0;
  int wardrobeValue = 0;
  int tvValue = 0;
  RxBool isWithoutHall = false.obs;
  RxBool isNegotiable = false.obs;
  RxBool isMonthlyRentNegotiable = false.obs;

  List<String> furnishedList = ["Furnished", "Unfurnished", "Semi-Furnished"];
  RxString furnishedValue = "Furnished".obs;

  List<FeatureCheckboxModel> featuresCheckboxList = [
    FeatureCheckboxModel(name: "Fridge", value: false),
    FeatureCheckboxModel(name: "Sofa", value: false),
    FeatureCheckboxModel(name: "Washing Machine", value: false),
    FeatureCheckboxModel(name: "Dining Table", value: false),
    FeatureCheckboxModel(name: "Microwave", value: false),
    FeatureCheckboxModel(name: "Gas Connection", value: false),

    //todo
    FeatureCheckboxModel(name: "Personal Wash Room", value: false), // 6
    FeatureCheckboxModel(name: "Personal Kitchen", value: false), // 7
    FeatureCheckboxModel(name: "Personal Cabin", value: false), // 8
    FeatureCheckboxModel(name: "Personal Lift", value: false), // 9
    FeatureCheckboxModel(name: "Security Cabin", value: false), // 10
    FeatureCheckboxModel(name: "Boundary", value: false), // 11
    FeatureCheckboxModel(name: "Main Gate", value: false), // 12
    FeatureCheckboxModel(name: "Some How Close Boundary", value: false), // 13
  ];

  TextEditingController propertyNameController = TextEditingController();
  TextEditingController propertySortDescController = TextEditingController();
  TextEditingController floorNoController = TextEditingController();
  TextEditingController totalFloorController = TextEditingController();
  TextEditingController superAreaController = TextEditingController();
  TextEditingController carpetAreaController = TextEditingController();
  TextEditingController varVighaYardController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController liftsInTowerController = TextEditingController();
  TextEditingController unitsOnFloorController = TextEditingController();
  // TextEditingController salePriceController = TextEditingController();
  TextEditingController monthlyRentController = TextEditingController();
  TextEditingController loanAmountController = TextEditingController();
  TextEditingController securityDepositeController = TextEditingController();
  TextEditingController maintenanceChargeController = TextEditingController();
  TextEditingController perSqFtRateController = TextEditingController();
  TextEditingController totalCarParkingController = TextEditingController();
  TextEditingController coveredCarParkingController = TextEditingController();
  TextEditingController openCarParkingController = TextEditingController();
  TextEditingController tenantRestrictionController = TextEditingController();
  TextEditingController securityFeaturesController = TextEditingController();
  TextEditingController occupantsStayController = TextEditingController();
  TextEditingController landMarkAndNearByController = TextEditingController();

  PropertyAvailability propertyAvailability = PropertyAvailability.date;
  SeparateCleaningArea separateCleaningArea = SeparateCleaningArea.yes;

  List<String> ageOfConstructionList = [
    "Under Construction",
    "1 to 3 Year",
    "3 to 5 Year",
    "5 to 7 Year",
    "7 to 10 Year",
    "10 to 15 Year",
    "15 to 20 Year",
    "More then 20 Year",
  ];
  String ageOfConstructionValue = "Under Construction";

  List<String> maintenanceTenureList = [
    "Monthly", "Quarterly", "Half Yearly", "Yearly"
  ];
  String maintenanceTenureValue = "Monthly";

  List<String> propertyTaxPayableByList = [
    "Owner", "50-50", "Customer"
  ];
  String propertyTaxPayableByValue = "Owner";

  DateTime selectedDate = DateTime.now();

  TenantBachelors tenantBachelors = TenantBachelors.yes;
  TenantNonVegetarian tenantNonVegetarian = TenantNonVegetarian.yes;
  TenantPets tenantPets = TenantPets.yes;
  TenantCompanyLease tenantCompanyLease = TenantCompanyLease.yes;

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
    "North-East",
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

  VisitorsRestriction visitorsRestriction = VisitorsRestriction.noRestriction;

  List<FeatureCheckboxModel> preferTenantList = [
    FeatureCheckboxModel(name: "Businessman", value: false),
    FeatureCheckboxModel(name: "Self Employed", value: false),
    FeatureCheckboxModel(name: "Salaried", value: false),
    FeatureCheckboxModel(name: "Goverment Emp.", value: false),
    FeatureCheckboxModel(name: "Retired Emp.", value: false),
    FeatureCheckboxModel(name: "No Preference", value: false),
  ];

  RxBool isAnyTime = false.obs;
  PreferredDayCall preferredDayCall = PreferredDayCall.anyDay;

  List<String> timeList = [ "",
    "7 AM", "8 AM", "9 AM", "10 AM", "11 AM", "12 PM", "1 PM", "2 PM", "3 PM",
    "4 PM", "5 PM", "6 PM", "7 PM", "8 PM", "9 PM", "10 PM",
  ];
  String fromTimeValue = "";
  String toTimeValue = "";

  CrossViolation crossViolation = CrossViolation.yes;
  CommonWall commonWall = CommonWall.yes;
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

  /// Get Search Property Name List Function
  Future<List<String>> getSearchNameListFunction(String searchText) async {


    return searchText.isEmpty
        ? propertyNameList
        : propertyNameList.where((element) {
      String searchListString = element.toLowerCase();
      String searchTextNew = searchText.toLowerCase();

      return searchListString.contains(searchTextNew);
    }).toList();

  }

  /// Create Property Function
  Future<void> createPropertyFunction() async {
    isLoading(true);
    String url = ApiUrl.createPropertyDetailsApi;
    log("Create Property Api Url : $url");

    try {
      Map<String, dynamic> data = mapData();
      log("data : ${jsonEncode(data)}");
      log("===================");
      log("apiHeader.sellerHeader : ${apiHeader.sellerHeader}");
      log("===================");

      http.Response response = await http.post(Uri.parse(url), headers: apiHeader.sellerHeader, body: jsonEncode(data));
      log("response : ${response.body}");
      log("sellerHeader : ${apiHeader.sellerHeader}");
      CreatePropertyModel createPropertyModel = CreatePropertyModel.fromJson(json.decode(response.body));
      isSuccessStatus = createPropertyModel.status.obs;

      if(isSuccessStatus.value) {
        Fluttertoast.showToast(msg: createPropertyModel.message);
        log("createPropertyModel.message : ${createPropertyModel.message}");
        Get.back();
      } else {
        log("Create Property Else Else");
        Fluttertoast.showToast(msg: "Please try again!");
      }

    } catch(e) {
      log("Create Property Error ::: $e");
    } finally {
      isLoading(false);
    }
  }



  /// Create Property Field Data
  Map<String, dynamic> mapData() {
    String details = "";
    String age = "";
    String propertyTax = "";
    String visitorRestriction = "";
    String water = "";
    String electricity = "";
    bool separateClean = false;
    bool crossVenti = false;
    bool commonWall1 = false;

    if(SeparateCleaningArea.yes == separateCleaningArea) {
      separateClean = true;
    }

    if(CrossViolation.yes == crossViolation) {
      crossVenti = true;
    }

    if(CommonWall.yes == commonWall) {
      commonWall1 = true;
    }


    // Property For
    if (propertyForValue.toString() == "Sale") {
      details = "sale";
    } else if (propertyForValue.toString() == "Rent/Lease") {
      details = "rent";
    } else {
      details = "pg";
    }

    // For Age
    if (ageOfConstructionValue.toString() == "Under Construction") {
      age = "0";
    } else if (ageOfConstructionValue.toString() == "1 to 3 Year") {
      age = "1";
    } else if (ageOfConstructionValue.toString() == "3 to 5 Year") {
      age = "2";
    } else if (ageOfConstructionValue.toString() == "5 to 7 Year") {
      age = "3";
    } else if (ageOfConstructionValue.toString() == "7 to 10 Year") {
      age = "4";
    } else if (ageOfConstructionValue.toString() == "10 to 15 Year") {
      age = "5";
    } else if (ageOfConstructionValue.toString() == "15 to 20 Year") {
      age = "6";
    } else {
      age = "7";
    }

    // Property Tax
    if (propertyTaxPayableByValue.toString() == "Owner") {
      propertyTax = "owner";
    } else if (propertyTaxPayableByValue.toString() == "50-50") {
      propertyTax = "50";
    } else {
      propertyTax = "customer";
    }

    // Visitor Restriction
    if(VisitorsRestriction.noRestriction == visitorsRestriction) {
      visitorRestriction = "no_restriction";
    } else if(VisitorsRestriction.overNightStayNotAllow == visitorsRestriction) {
      visitorRestriction = "no_overnight_stay";
    } else {
      visitorRestriction = "no_visitor";
    }


    // Water
    if(availabilityOfWaterValue == "24 Hours") {
      water = "24";
    } else if(availabilityOfWaterValue == "18 to 24 Hour") {
      water = "18_24";
    } else if(availabilityOfWaterValue == "12 to 18 Hour") {
      water = "12_18";
    } else if(availabilityOfWaterValue == "6 to 12 Hour") {
      water = "6-12";
    } else if(availabilityOfWaterValue == "3 to 6 Hour") {
      water = "3_6";
    } else if(availabilityOfWaterValue == "0 to 3 Hour") {
      water = "0_3";
    }

    // Electricity
    if(availabilityOfElectricityValue == "24 Hours") {
      electricity = "24";
    } else if(availabilityOfElectricityValue == "18 to 24 Hour") {
      electricity = "18_24";
    } else if(availabilityOfElectricityValue == "12 to 18 Hour") {
      electricity = "12_18";
    } else if(availabilityOfElectricityValue == "6 to 12 Hour") {
      electricity = "6-12";
    } else if(availabilityOfElectricityValue == "3 to 6 Hour") {
      electricity = "3_6";
    } else if(availabilityOfElectricityValue == "0 to 3 Hour") {
      electricity = "0_3";
    }


    Map<String, dynamic> apiData = {
      "basic": {
        "detail":details,
        "property_type_id":propertyTypeValue.id,
        "city_id":cityValue.id,
        "area_id":areaValue.id,
        "title": propertyNameController.text,
        "bedrooms":bedRoomValue,
        "balconies":balconiesValue,
        "hall": isWithoutHall.value,
        "floor_number": floorNoController.text,
        "total_floor":totalFloorController.text,
        "furnished":furnishedValue.value.toLowerCase(),
        "bathrooms":"$bathRoomsValue",
        "ac":"$acValue",
        "bed":"$bedValue",
        "wardrobe":"$wardrobeValue",
        "tv":"$tvValue",
        "fridge": featuresCheckboxList[0].value,
        "sofa": featuresCheckboxList[1].value,
        "washing_machine":featuresCheckboxList[2].value,
        "dining_table":featuresCheckboxList[3].value,
        "microwave":featuresCheckboxList[4].value,
        "gas":featuresCheckboxList[5].value,
        "carpet_area":carpetAreaController.text.trim(),
        "super_area":superAreaController.text.trim(),
        "availabilty":propertyAvailability.name.toLowerCase(),
        "availabilty_date":"${selectedDate.day}-${selectedDate.month}-${selectedDate.year}",
        "age":age,
        "rent":monthlyRentController.text.trim(),
        "security_deposite":securityDepositeController.text.trim(),
        "maintenance":maintenanceChargeController.text.trim(),
        "maintenance_tenure":maintenanceTenureValue.toLowerCase(),
        "agree":true,
        "lift":liftsInTowerController.text.trim(),
        "flat_floor":unitsOnFloorController.text.trim(),
        "utility":separateClean,
        "negotiable":isNegotiable.value,
        "sort_desc":propertySortDescController.text.trim(),
        "property_tax":propertyTax,
        "personal_wash_room":featuresCheckboxList[6].value,//todo
        "personal_keychain":featuresCheckboxList[7].value,
        "cabin":featuresCheckboxList[8].value,
        "personal_lift":featuresCheckboxList[9].value,
        "boundry":featuresCheckboxList[11].value,
        "main_gate":featuresCheckboxList[12].value,
        "open_boundry":featuresCheckboxList[13].value,
        "security_cabin":featuresCheckboxList[10].value,
        "yard":varVighaYardController.text.trim(),
        "height":heightController.text.trim(),
        "sq_rate":perSqFtRateController.text.trim()
      },
      "tenant":{
        "bachelors":tenantBachelors.name,
        "non_vegetarians":tenantNonVegetarian.name,
        "pets":tenantPets.name,
        "company_lease":tenantCompanyLease.name,
        "pooja_room":additionalRoomsList[0].value,
        "study":additionalRoomsList[1].value,
        "store":additionalRoomsList[2].value,
        "servant_room":additionalRoomsList[3].value,
        "facing":facingValue.toLowerCase(),
        "garden":overlookingList[0].value,
        "pool":overlookingList[1].value,
        "main_road":overlookingList[2].value,
        "water":water,
        "electricity":electricity,
        "ceramic_tiles":flooringList[0].value,
        "granite":flooringList[1].value,
        "marble":flooringList[2].value,
        "marbonite":flooringList[3].value,
        "mosaic":flooringList[4].value,
        "normal":flooringList[5].value,
        "vitrified":flooringList[6].value,
        "wooden":flooringList[7].value,
        "gym":aminitiesList[0].value,
        "jogging":aminitiesList[1].value,
        "lift_available":aminitiesList[2].value,
        "pipe_gas":aminitiesList[3].value,
        "power_backup":aminitiesList[4].value,
        "reserved_parking":aminitiesList[5].value,
        "security":aminitiesList[6].value,
        "swimming_pool":aminitiesList[7].value,
        "near_by":landMarkAndNearByController.text.trim(),
        "total_car_parking":totalCarParkingController.text.trim(),
        "covered_car_parking":coveredCarParkingController.text.trim(),
        "open_car_parking":openCarParkingController.text.trim()
      },
      "owner":{
        "restriction_visitors":visitorRestriction,
        "restriction_tenant":tenantRestrictionController.text.trim(),
        "businessman":preferTenantList[0].value,
        "self_employed":preferTenantList[1].value,
        "salaried":preferTenantList[2].value,
        "goverment":preferTenantList[3].value,
        "retired":preferTenantList[4].value,
        "no_preference":preferTenantList[5].value,
        "call_anytime":isAnyTime.value,
        "security":securityFeaturesController.text.trim(),
        "occupants":occupantsStayController.text.trim(),
        "cross_ventilation":crossVenti == false ? "no" : "yes",
        "common_wall":commonWall1,
        "from_time":fromTimeValue,
        "to_time":toTimeValue
      }
    };


    return apiData;
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