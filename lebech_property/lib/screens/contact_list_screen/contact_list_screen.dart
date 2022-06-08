import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/custom_appbar/custom_appbar.dart';
import '../../controllers/contact_list_screen_controller/contact_list_screen_controller.dart';

class ContactListScreen extends StatelessWidget {
  ContactListScreen({Key? key}) : super(key: key);
  final contactListScreenController = Get.put(ContactListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Contacts"),
      body: Obx(
        () => contactListScreenController.isLoading.value
            ? const CircularProgressIndicator()
            : contactListScreenController.contactsList.isEmpty
                ? const Center(child: Text("No Data Available!"))
                : ListView.builder(
                    itemCount: contactListScreenController.contactsList.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, i) {
                      return _contactListTile();
                    },
                  ),
      ),
    );
  }

  Widget _contactListTile() {
    return Container();
  }
}
