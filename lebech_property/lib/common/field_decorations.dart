import 'package:flutter/material.dart';
import 'package:lebech_property/common/constants/app_colors.dart';
import '../controllers/direct_search_screen_controller/direct_search_screen_controller.dart';
import '../controllers/search_screen_controller/search_screen_controller.dart';
import '../controllers/sign_in_screen_controller/sign_in_screen_controller.dart';
import '../controllers/sign_up_screen_controller/sign_up_screen_controller.dart';
import 'common_functions.dart';

InputDecoration searchFieldDecoration(
    {required String hintText,
    required SearchScreenController screenController}) {
  return InputDecoration(
    hintText: hintText,
    fillColor: Colors.white,
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.white),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.white),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.white),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.white),
    ),
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    counterText: '',
    suffixIcon: IconButton(
      onPressed: () async {
        String searchText = screenController.searchFieldController.text.trim();
        await screenController.searchResultFunction(searchText: searchText);
        hideKeyBoard();
      },
      icon: const Icon(Icons.search, size: 25, color: Colors.red),
    ),
  );
}

InputDecoration directSearchFieldDecoration(
    {required String hintText,
    required DirectSearchScreenController screenController}) {
  return InputDecoration(
    hintText: hintText,
    fillColor: Colors.white,
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.white),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.white),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.white),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.white),
    ),
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    counterText: '',
    suffixIcon: IconButton(
      onPressed: () async {
        String searchText =
            screenController.directSearchFieldController.text.trim();
        await screenController.directSearchFunction(searchText: searchText);
        hideKeyBoard();
      },
      icon: const Icon(Icons.search, size: 25, color: Colors.red),
    ),
  );
}

InputDecoration signInFormFieldDecoration(
    {required String hintText,
    int index = 0,
    required SignInScreenController controller}) {
  return InputDecoration(
    hintText: hintText,
    fillColor: Colors.white,
    filled: true,
    errorStyle: const TextStyle(color: Colors.white),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.white),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.white),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.white),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.white),
    ),
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    counterText: '',
    suffixIcon: index == 1
        ? GestureDetector(
            onTap: () {
              controller.isPasswordShow.value =
                  !controller.isPasswordShow.value;
            },
            child: Icon(
              controller.isPasswordShow.value
                  ? Icons.visibility_off_rounded
                  : Icons.visibility_rounded,
              color: AppColors.greenColor,
              size: 22,
            ),
          )
        : null,
  );
}

InputDecoration signUpFormFieldDecoration(
    {required String hintText,
    int index = 0,
    required SignUpScreenController controller}) {
  return InputDecoration(
    hintText: hintText,
    fillColor: Colors.white,
    filled: true,
    errorStyle: const TextStyle(color: Colors.white),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.white),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.white),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.white),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.white),
    ),
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    counterText: '',
    suffixIcon: index == 1
        ? GestureDetector(
            onTap: () {
              controller.isPasswordShow.value =
                  !controller.isPasswordShow.value;
            },
            child: Icon(
              controller.isPasswordShow.value
                  ? Icons.visibility_off_rounded
                  : Icons.visibility_rounded,
              color: AppColors.greenColor,
              size: 22,
            ),
          )
        : index == 2
            ? GestureDetector(
                onTap: () {
                  controller.isCPasswordShow.value =
                      !controller.isCPasswordShow.value;
                },
                child: Icon(
                  controller.isCPasswordShow.value
                      ? Icons.visibility_off_rounded
                      : Icons.visibility_rounded,
                  color: AppColors.greenColor,
                  size: 22,
                ),
              )
            : null,
  );
}
