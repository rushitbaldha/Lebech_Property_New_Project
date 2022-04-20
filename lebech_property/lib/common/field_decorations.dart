import 'package:flutter/material.dart';
import '../controllers/search_screen_controller/search_screen_controller.dart';


InputDecoration searchFieldDecoration({required String hintText, required SearchScreenController screenController}) {
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
        },
      icon: const Icon(Icons.search, size: 25, color: Colors.red),
    ),
  );
}

InputDecoration formFieldDecoration({required String hintText}) {
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
  );
}