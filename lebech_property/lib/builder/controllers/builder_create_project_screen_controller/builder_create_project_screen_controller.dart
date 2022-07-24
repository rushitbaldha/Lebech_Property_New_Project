import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:lebech_property/builder/models/builder_create_project_screen_models/facilities_model.dart';
import 'package:lebech_property/builder/screens/builder_create_project_screen/builder_create_project_screen_widgets.dart';
import 'package:lebech_property/common/constants/api_url.dart';
import 'package:lebech_property/seller/models/seller_create_property_screen_model/form_basic_details_model.dart';

class BuilderCreateProjectScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  List<String> propertyNameList = [];
  String propertyNameValue = "";

  List<Property> propertyTypeList = [];
  Property propertyTypeValue = Property();

  List<BasicCity> cityList = [BasicCity(name: "Select City")];
  BasicCity cityValue = BasicCity(name: "Select City");

  List<BasicArea> areaList = [BasicArea(name: "Select Area")];
  BasicArea areaValue = BasicArea(name: "Select Area");

  List<BasicCategory> categoryList = [BasicCategory(name: "Select Category")];
  BasicCategory categoryValue = BasicCategory(name: "Select Category");

  TextEditingController projectNameController = TextEditingController();
  TextEditingController projectAddressController = TextEditingController();
  TextEditingController projectOfficeAddressController = TextEditingController();
  TextEditingController projectPhoneNoController = TextEditingController();
  TextEditingController projectEmailController = TextEditingController();
  QuillController whyConsiderProjectQuillController = QuillController.basic();
  QuillController moreAboutProjectQuillController = QuillController.basic();
  QuillController aboutBuilderQuillController = QuillController.basic();

  List<PriceRangeSingleItemModule> priceRangeList = [
    PriceRangeSingleItemModule(),
  ];

  List<AddNearBySingleModule> addNearByList = [
    AddNearBySingleModule(),
  ];

  List<YouTubeVideoLinkModule> ytVideoLinkList = [
    YouTubeVideoLinkModule(),
  ];





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

        categoryList.addAll(formBasicDetailsModel.data.category);
        categoryValue = categoryList[0];


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


  List<Facilities> facilitiesList = [
    Facilities(isSelected: false, name: "Swimming Pool", value: ""),
    Facilities(isSelected: false, name: "Garden", value: ""),
    Facilities(isSelected: false, name: "Pergola", value: ""),
    Facilities(isSelected: false, name: "Sun Deck", value: ""),
    Facilities(isSelected: false, name: "Lawn Tennis Court", value: ""),
    Facilities(isSelected: false, name: "Video Door Security", value: ""),
    Facilities(isSelected: false, name: "Toddler Pool", value: ""),
    Facilities(isSelected: false, name: "Table Tennis", value: ""),
    Facilities(isSelected: false, name: "Basketball Court", value: ""),
    Facilities(isSelected: false, name: "Clinic", value: ""),
    Facilities(isSelected: false, name: "Theater", value: ""),
    Facilities(isSelected: false, name: "Lounge", value: ""),
    Facilities(isSelected: false, name: "Salon", value: ""),
    Facilities(isSelected: false, name: "Aerobics", value: ""),
    Facilities(isSelected: false, name: "Visitors Parking", value: ""),
    Facilities(isSelected: false, name: "Spa", value: ""),
    Facilities(isSelected: false, name: "Creche Day Care", value: ""),
    Facilities(isSelected: false, name: "Barbecue", value: ""),
    Facilities(isSelected: false, name: "Terrace Garden", value: ""),
    Facilities(isSelected: false, name: "Water Softener Plant", value: ""),
    Facilities(isSelected: false, name: "Fountain", value: ""),
    Facilities(isSelected: false, name: "Multipurpose Court", value: ""),
    Facilities(isSelected: false, name: "Amphitheatre", value: ""),
    Facilities(isSelected: false, name: "Business Lounge", value: ""),
    Facilities(isSelected: false, name: "Squash Court", value: ""),
    Facilities(isSelected: false, name: "Cafeteria", value: ""),
    Facilities(isSelected: false, name: "Library", value: ""),
    Facilities(isSelected: false, name: "Cricket Pitch", value: ""),
    Facilities(isSelected: false, name: "Medical Centre", value: ""),
    Facilities(isSelected: false, name: "Card Room", value: ""),
    Facilities(isSelected: false, name: "Restaurant", value: ""),
    Facilities(isSelected: false, name: "Sauna", value: ""),
    Facilities(isSelected: false, name: "Jacuzzi", value: ""),
    Facilities(isSelected: false, name: "Steam Room", value: ""),
    Facilities(isSelected: false, name: "High Speed Elevators", value: ""),
    Facilities(isSelected: false, name: "Football", value: ""),
    Facilities(isSelected: false, name: "Skating Rink", value: ""),
    Facilities(isSelected: false, name: "Grocery Shop", value: ""),
    Facilities(isSelected: false, name: "Wi-Fi", value: ""),
    Facilities(isSelected: false, name: "Banquet Hall", value: ""),
    Facilities(isSelected: false, name: "Party Lawn", value: ""),
    Facilities(isSelected: false, name: "Indoor Games", value: ""),
    Facilities(isSelected: false, name: "CCTV Camera", value: ""),
  ];



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