import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';
import '../../common/common_widgets.dart';
import '../../common/constants/text_styles.dart';
import '../../controllers/property_details_screen_controller/property_details_screen_controller.dart';


class PropertyImageSliderModule extends StatelessWidget {
  PropertyImageSliderModule({Key? key}) : super(key: key);
  final screenController = Get.find<PropertyDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CarouselSlider.builder(
            itemCount: screenController.propertyBannerLists.length,
            itemBuilder: (context, index, realIndex) {
              return propertyBannerListTile(index);
            },
            options: CarouselOptions(
                height: 180,
                autoPlay: true,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  screenController.activeBannerIndex.value = index;
                }),
          ),

          propertyBannerIndicatorModule(),
        ],
      ).commonAllSidePadding(padding: 10),
    );
  }

  Widget propertyBannerListTile(int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: NetworkImage(screenController.propertyBannerLists[index]),
          fit: BoxFit.cover,
        ),
      ),
    ).commonSymmetricPadding(horizontal: 8);
  }

  Widget propertyBannerIndicatorModule() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          screenController.propertyBannerLists.length,
              (index) => Container(
            margin: const EdgeInsets.all(4),
            width: screenController.activeBannerIndex.value == index ? 14 : 11,
            height: screenController.activeBannerIndex.value == index ? 14 : 11,
            decoration: BoxDecoration(
              color: screenController.activeBannerIndex.value == index
                  ? Colors.red
                  : Colors.grey.shade400,
              shape: BoxShape.circle,
            ),
          )),
    );
  }

}

class PropertyDetailsModule extends StatelessWidget {
  const PropertyDetailsModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        HeadingModule(heading: 'Property Detail'),
        SizedBox(height: 10),
        DetailsModule(),
      ],
    ).commonSymmetricPadding(horizontal: 10);
  }

}

class DetailsModule extends StatelessWidget {
  const DetailsModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _singleDetailsModule(heading: 'Furnished', value: 'Furnished'),
        _singleDetailsModule(heading: 'Non Vegetarians', value: 'No'),
        _singleDetailsModule(heading: 'Facing', value: 'SOUTH EAST'),
        _singleDetailsModule(heading: 'Water', value: '18-24 Hour'),
        _singleDetailsModule(heading: 'Age', value: '1'),
        _singleDetailsModule(heading: 'Bachelors', value: 'No'),
        _singleDetailsModule(heading: 'Pets', value: 'No'),
        _singleDetailsModule(heading: 'Total Car Parking', value: '5'),
        _singleDetailsModule(heading: 'Covered Car Parking', value: '2'),
        _singleDetailsModule(heading: 'Open Car Parking', value: '3'),
        _singleDetailsModule(heading: 'Electricity', value: '18-24 Hour'),
        _singleDetailsModule(heading: 'Floor Number', value: '9'),
        _singleDetailsModule(heading: 'Total Floor', value: '14'),
        _singleDetailsModule(heading: 'Unit On Floor', value: '5'),
      ],
    ).commonSymmetricPadding(horizontal: 10);
  }

  _singleDetailsModule({required String heading, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            heading,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: detailsHeadingStyle(),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          value.toUpperCase(),
          textAlign: TextAlign.end,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: detailsHeadingStyle(),
        ),
      ],
    );
  }

}


class FactNumbersModule extends StatelessWidget {
  const FactNumbersModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeadingModule(heading: 'Fact Numbers'),
        const SizedBox(height: 10),
        _detailsModule(),
      ],
    ).commonSymmetricPadding(horizontal: 10);
  }

  Widget _detailsModule() {
    return Column(
      children: [
        _singleDetailsModule(heading: 'Carpet Area', value: '2800 Sq. Ft'),
        const SizedBox(height: 3),
        _singleDetailsModule(heading: 'Super Area', value: '4975 Sq. Ft'),
        const SizedBox(height: 3),
        _singleDetailsModule(heading: 'Construction Age', value: '0 Year'),
        const SizedBox(height: 3),
        _singleDetailsModule(heading: 'Sale Price', value: '3.10 CRORE₹'),
        const SizedBox(height: 3),
        _singleDetailsModule(heading: 'Loan Amount', value: '₹'),
      ],
    );
  }

  _singleDetailsModule({required String heading, required String value}) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(color: Colors.grey.shade200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              heading,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: detailsHeadingStyle(),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            value.toUpperCase(),
            textAlign: TextAlign.end,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: detailsHeadingStyle(),
          ),

        ],
      ),
    );
  }

}

class FactsAndFeaturesModule extends StatelessWidget {
  const FactsAndFeaturesModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeadingModule(heading: 'Facts and Features'),
        const SizedBox(height: 10),
        GridView.builder(
          itemCount: 4,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2.1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, i) {
            return _factsAndFeaturesGridTile();
          },
        ),
      ],
    ).commonSymmetricPadding(horizontal: 10);
  }

  Widget _factsAndFeaturesGridTile() {
    return Container(
      padding: const EdgeInsets.all(10),
      // decoration: BoxDecoration(
      //   color: Colors.grey.shade200,
      // ),
      child: Row(
        children: [
          Expanded(
            flex: 40,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red.shade300,
              ),
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            flex: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Bedroom',
                  maxLines: 1,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 5),
                Text(
                  '4',
                  maxLines: 1,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

