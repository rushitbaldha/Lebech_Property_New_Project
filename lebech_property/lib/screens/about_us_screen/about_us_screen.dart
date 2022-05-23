import 'package:flutter/material.dart';

import '../../common/custom_appbar/custom_appbar.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "About Us"),

      body: Column(
        children: [

        ],
      ),
    );
  }
}
