import 'dart:convert';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lebech_property/common/constants/api_header.dart';
import 'package:lebech_property/common/constants/api_url.dart';
import 'package:lebech_property/common/user_details/user_details.dart';
import 'package:lebech_property/seller/models/add_property_image_screen_model/add_property_image_model.dart';
import 'package:lebech_property/seller/models/add_property_image_screen_model/get_property_images_model.dart';

class AddPropertyImageScreenController extends GetxController {
  final propertyId = Get.arguments[0];
  final propertyTitle = Get.arguments[1];
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  ApiHeader apiHeader = ApiHeader();

  List<XFile> imageFileList = [];
  List imageLengthList = [];
  List streamLengthList = [];
  List multipartList = [];

  List<Datum> apiImagesList = [];


  // Add Property Image
  Future<void> addPropertyImagesFunction() async {
    isLoading(true);
    String url = ApiUrl.addBrokerPropertyImagesApi;
    log("Add Property Images Api Url :$url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(apiHeader.sellerHeader);

      for(int i = 0; i < imageFileList.length; i++) {
        var stream = http.ByteStream(imageFileList[i].openRead());
        stream.cast();
        streamLengthList.add(stream);
      }

      for(int i = 0; i < imageFileList.length; i++) {
        var length = await imageFileList[i].length();
        imageLengthList.add(length);
      }

      for(int i = 0; i < imageFileList.length; i++) {
        request.files.add(await http.MultipartFile.fromPath("images[$i]", imageFileList[i].path));
      }

      for(int i = 0; i < imageFileList.length; i++) {
        var multiPart = http.MultipartFile('Image', streamLengthList[i], imageLengthList[i]);
        request.files.add(multiPart);
      }

      request.fields['property_id'] = "$propertyId";

      log("request.files : ${request.files}");
      log("request.fields : ${request.fields}");

      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async{
        log("Value : $value");
        AddPropertyImageModule addPropertyImageModule = AddPropertyImageModule.fromJson(json.decode(value));
        isSuccessStatus = addPropertyImageModule.status.obs;
        log('isSuccessStatus : ${isSuccessStatus.value}');

        if(isSuccessStatus.value) {
          Fluttertoast.showToast(msg: addPropertyImageModule.message);
          // log("Message : ${addPropertyImageModule.message}");
          // Get.back();
        } else {
          log('addPropertyImagesFunction Else');
        }

      });

    } catch(e) {
      log("Add Property Images Function Error ::: $e");
    } finally {
      // isLoading(false);
      await getPropertyImagesFunction();
    }
  }

  // Get Property Image
  Future<void> getPropertyImagesFunction() async {
    isLoading(true);
    String url = ApiUrl.getPropertyImagesApi;
    log("Get Property Image List Api Url : $url");

    try {
      Map<String, dynamic> data = {
        "property_id" : "$propertyId"
      };

      Map<String, String> sellerHeader = <String,String> {
        'Authorization': "Bearer ${UserDetails.userToken}"
        //'Authorization': "Bearer 85|nE54BkonvXUdxxTyZKT8KVXz0rYkaD8EokJjZzKv"
      };
      http.Response response = await http.post(
          Uri.parse(url),
          headers: sellerHeader,
          body: data);
      log("Get Property Response :${response.body}");

      PropertyImagesModel propertyImagesModel = PropertyImagesModel.fromJson(json.decode(response.body));
      isSuccessStatus = propertyImagesModel.status.obs;

      if(isSuccessStatus.value) {
        apiImagesList.clear();
        apiImagesList.addAll(propertyImagesModel.data.data);
      } else {
        log("Get Property Images Api Else");
      }


    } catch(e) {
      log("Get Property Image Error ::: $e");
    } finally {
      isLoading(false);
    }
  }


  @override
  void onInit() {
    getPropertyImagesFunction();
    super.onInit();
  }


}