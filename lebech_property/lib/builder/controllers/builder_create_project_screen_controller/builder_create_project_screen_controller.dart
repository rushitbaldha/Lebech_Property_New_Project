import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:lebech_property/builder/models/builder_create_project_screen_models/facilities_model.dart';
import 'package:lebech_property/builder/models/builder_create_project_screen_models/project_create_model.dart';
import 'package:lebech_property/builder/screens/builder_create_project_screen/builder_create_project_screen_widgets.dart';
import 'package:lebech_property/common/constants/api_header.dart';
import 'package:lebech_property/common/constants/api_url.dart';
import 'package:lebech_property/seller/models/seller_create_property_screen_model/form_basic_details_model.dart';

class BuilderCreateProjectScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

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

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController projectNameController = TextEditingController();
  TextEditingController projectAddressController = TextEditingController();
  TextEditingController projectOfficeAddressController = TextEditingController();
  TextEditingController projectPhoneNoController = TextEditingController();
  TextEditingController projectEmailController = TextEditingController();
  QuillController whyConsiderProjectQuillController = QuillController.basic();
  QuillController moreAboutProjectQuillController = QuillController.basic();
  QuillController aboutBuilderQuillController = QuillController.basic();

  List<PriceRangeSingleItemModule> priceRangeList = [PriceRangeSingleItemModule()];
  List<AddNearBySingleModule> addNearByList = [AddNearBySingleModule()];
  List<YouTubeVideoLinkModule> ytVideoLinkList = [YouTubeVideoLinkModule()];


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
    Facilities(isSelected: false, name: "Swimming Pool", value: ""), // 0
    Facilities(isSelected: false, name: "Garden", value: ""),
    Facilities(isSelected: false, name: "Pergola", value: ""),
    Facilities(isSelected: false, name: "Sun Deck", value: ""),
    Facilities(isSelected: false, name: "Lawn Tennis Court", value: ""),
    Facilities(isSelected: false, name: "Video Door Security", value: ""), // 5
    Facilities(isSelected: false, name: "Toddler Pool", value: ""),
    Facilities(isSelected: false, name: "Table Tennis", value: ""),
    Facilities(isSelected: false, name: "Basketball Court", value: ""),
    Facilities(isSelected: false, name: "Clinic", value: ""),
    Facilities(isSelected: false, name: "Theater", value: ""), // 10
    Facilities(isSelected: false, name: "Lounge", value: ""),
    Facilities(isSelected: false, name: "Salon", value: ""),
    Facilities(isSelected: false, name: "Aerobics", value: ""),
    Facilities(isSelected: false, name: "Visitors Parking", value: ""),
    Facilities(isSelected: false, name: "Spa", value: ""), // 15
    Facilities(isSelected: false, name: "Creche Day Care", value: ""),
    Facilities(isSelected: false, name: "Barbecue", value: ""),
    Facilities(isSelected: false, name: "Terrace Garden", value: ""),
    Facilities(isSelected: false, name: "Water Softener Plant", value: ""),
    Facilities(isSelected: false, name: "Fountain", value: ""), // 20
    Facilities(isSelected: false, name: "Multipurpose Court", value: ""),
    Facilities(isSelected: false, name: "Amphitheatre", value: ""),
    Facilities(isSelected: false, name: "Business Lounge", value: ""),
    Facilities(isSelected: false, name: "Squash Court", value: ""),
    Facilities(isSelected: false, name: "Cafeteria", value: ""), // 25
    Facilities(isSelected: false, name: "Library", value: ""),
    Facilities(isSelected: false, name: "Cricket Pitch", value: ""),
    Facilities(isSelected: false, name: "Medical Centre", value: ""),
    Facilities(isSelected: false, name: "Card Room", value: ""),
    Facilities(isSelected: false, name: "Restaurant", value: ""), // 30
    Facilities(isSelected: false, name: "Sauna", value: ""),
    Facilities(isSelected: false, name: "Jacuzzi", value: ""),
    Facilities(isSelected: false, name: "Steam Room", value: ""),
    Facilities(isSelected: false, name: "High Speed Elevators", value: ""),
    Facilities(isSelected: false, name: "Football", value: ""), // 35
    Facilities(isSelected: false, name: "Skating Rink", value: ""),
    Facilities(isSelected: false, name: "Grocery Shop", value: ""),
    Facilities(isSelected: false, name: "Wi-Fi", value: ""),
    Facilities(isSelected: false, name: "Banquet Hall", value: ""),
    Facilities(isSelected: false, name: "Party Lawn", value: ""), // 40
    Facilities(isSelected: false, name: "Indoor Games", value: ""),
    Facilities(isSelected: false, name: "CCTV Camera", value: ""),
  ];


  /// Create Project Function
  Future<void> createProjectFunction() async {
    isLoading(true);
    String url = ApiUrl.addBuilderProjectApi;
    log("Create Builder Project Api Url : $url");

    try {
      Map<String, dynamic> apiData = crateProjectData();
      log("apiData : $apiData");

      http.Response response = await http.post(
        Uri.parse(url),
        body: apiData,
        headers: apiHeader.sellerHeader,
      );

      ProjectCreateModel projectCreateModel = ProjectCreateModel.fromJson(json.decode(response.body));
      isSuccessStatus = projectCreateModel.status.obs;

      if(isSuccessStatus.value) {
        Fluttertoast.showToast(msg: projectCreateModel.data.msg);
        Get.back();
      } else {
        log("Create Project Else Else");
      }
      
    } catch(e) {
      log("Create Project Function Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  Map<String, dynamic> crateProjectData() {
    Map<String, dynamic> data = {
      "name" : projectNameController.text.trim(),
      "site_address" : projectAddressController.text.trim(),
      "office_address" : projectOfficeAddressController.text.trim(),
      "phone" : projectPhoneNoController.text.trim(),
      "email" : projectEmailController.text.trim().toLowerCase(),
      "project_category_id" : "${categoryValue.id}",
      "area_id" : "${areaValue.id}",
      "city_id" : "${cityValue.id}",
      "swimming_pool" : facilitiesList[0].isSelected,
      "garden" : facilitiesList[1].isSelected,
      "pergola" : facilitiesList[2].isSelected,
      "sun_deck" : facilitiesList[3].isSelected,
      "lawn_tennis_court" : facilitiesList[4].isSelected,
      "video_door_security" : facilitiesList[5].isSelected,
      "toddler_pool" : facilitiesList[6].isSelected,
      "table_tennis" : facilitiesList[7].isSelected,
      "basketball_court" : facilitiesList[8].isSelected,
      "clinic" : facilitiesList[9].isSelected,
      "theater" : facilitiesList[10].isSelected,
      "lounge" : facilitiesList[11].isSelected,
      "salon" : facilitiesList[12].isSelected,
      "aerobics" : facilitiesList[13].isSelected,
      "visitors_parking" : facilitiesList[14].isSelected,
      "spa" : facilitiesList[15].isSelected,
      "creche_day_care" : facilitiesList[16].isSelected,
      "barbecue" : facilitiesList[17].isSelected,
      "terrace_garden" : facilitiesList[18].isSelected,
      "water_softener_plant" : facilitiesList[19].isSelected,
      "fountain" : facilitiesList[20].isSelected,
      "multipurpose_court" : facilitiesList[21].isSelected,
      "amphitheatre" : facilitiesList[22].isSelected,
      "business_lounge" : facilitiesList[23].isSelected,
      "squash_court" : facilitiesList[24].isSelected,
      "cafeteria" : facilitiesList[25].isSelected,
      "library" : facilitiesList[26].isSelected,
      "cricket_pitch" : facilitiesList[27].isSelected,
      "medical_centre" : facilitiesList[28].isSelected,
      "card_room" : facilitiesList[29].isSelected,
      "restaurant" : facilitiesList[30].isSelected,
      "sauna" : facilitiesList[31].isSelected,
      "jacuzzi" : facilitiesList[32].isSelected,
      "steam_room" : facilitiesList[33].isSelected,
      "high_speed_elevators" : facilitiesList[34].isSelected,
      "football" : facilitiesList[35].isSelected,
      "skating_rink" : facilitiesList[36].isSelected,
      "grocery_shop" : facilitiesList[37].isSelected,
      "wi_fi" : facilitiesList[38].isSelected,
      "banquet_hall" : facilitiesList[39].isSelected,
      "party_lawn" : facilitiesList[40].isSelected,
      "indoor_games" : facilitiesList[41].isSelected,
      "cctv" : facilitiesList[42].isSelected,
      "why" : whyConsiderProjectQuillController.document.toString(),
      "about" : moreAboutProjectQuillController.document.toString(),
      "about_builder" : aboutBuilderQuillController.document.toString()
    };

    return data;
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