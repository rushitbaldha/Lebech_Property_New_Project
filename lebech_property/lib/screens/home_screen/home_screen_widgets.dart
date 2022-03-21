import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/common/constants/app_images.dart';
import 'package:lebech_property/controllers/home_screen_controller/home_screen_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../common/field_decorations.dart';

class SearchBarModule extends StatelessWidget {
  SearchBarModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
      child: TextFormField(
        controller: screenController.searchFieldController,
        keyboardType: TextInputType.text,
        cursorColor: Colors.red,
        decoration: searchFieldDecoration(hintText: 'Search Property', screenController: screenController),
      ),
    );
  }
}

class BannerModule extends StatelessWidget {
  BannerModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: screenController.bannerLists.length,
      itemBuilder: (context, index, realIndex) {
        return bannerListTile(index);
      },
      options: CarouselOptions(
          height: 150,
          autoPlay: true,
          viewportFraction: 1,
          enlargeCenterPage: true,
          onPageChanged: (index, reason) {
            screenController.activeBannerIndex.value = index;
          }),
    );
  }

  Widget bannerListTile(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage(screenController.bannerLists[index]),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

}

class BannerIndicatorModule extends StatelessWidget {
  BannerIndicatorModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          screenController.bannerLists.length,
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
          ),
        ),
      ),
    );
  }
}

class NewProjectsModule extends StatelessWidget {
  const NewProjectsModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'New Projects',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 180,
          child: ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 55,
                        child: _imageModule(),
                      ),
                      // const SizedBox(height: 5),
                      Expanded(
                        flex: 45,
                        child: _propertyDetails(),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text(
                'See All New Projects',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(width: 5),
              Icon(Icons.arrow_forward_rounded, color: Colors.red, size: 19),
            ],
          ),
        ),
      ],
    );
  }

  Widget _imageModule() {
    return Container(
      width: 180,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        image: DecorationImage(
          image: AssetImage(AppImages.banner1Img),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _propertyDetails() {
    return Container(
      width: 180,
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            '2 BHK Flat',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 13,
            ),
          ),
          SizedBox(height: 5),
          Text(
            '₹ 1.25 Cr | 1450 sqft',
            maxLines: 1,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
              'Rajhans Cornello',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class YoutubeVideoModule extends StatelessWidget {
  YoutubeVideoModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _primePropertyHeading(),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            height: 180,
            color: Colors.grey,
            child: YoutubePlayerBuilder(
              player: YoutubePlayer(
                controller: screenController.youtubePlayerController!,
                showVideoProgressIndicator: true,
              ),
              builder: (context, player) {
                return SizedBox(
                  height: 180,
                  child: player,
                );
              },
            ),
          ),
        ),
      ],
    );
  }


  Widget _primePropertyHeading() {
    return const Text(
      'Prime Property',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
    );
  }


}

class Banner2Module extends StatelessWidget {
  Banner2Module({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: screenController.bannerLists.length,
      itemBuilder: (context, index, realIndex) {
        return bannerListTile(index);
      },
      options: CarouselOptions(
          height: 150,
          autoPlay: true,
          viewportFraction: 1,
          enlargeCenterPage: true,
          onPageChanged: (index, reason) {
            screenController.activeBannerIndex.value = index;
          }),
    );
  }

  Widget bannerListTile(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage(screenController.bannerLists[index]),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

}

class AminitiesTextModule extends StatelessWidget {
  const AminitiesTextModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        'Building Aminities',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
      ),
    );
  }
}

class AminitiesModule extends StatelessWidget {
  const AminitiesModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 300,
        child: GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1,
          ),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, i) {
            return Container(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Column(
                    children: [
                      Expanded(
                        flex: 80,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.red.shade100,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Icon(Icons.home_rounded, color: Colors.red, size: 35),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  'CCTV',
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 8),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 20,
                        child: Container(),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 8,
                    child: Material(
                      elevation: 10,
                      // shape: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 40,
                        width: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey),
                          color: Colors.white,
                        ),
                        child: const Icon(Icons.arrow_forward_rounded),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class LatestNewsFeedModule extends StatelessWidget {
  LatestNewsFeedModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: GestureDetector(
              onTap: () => screenController.previousClick(),
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.red),
                  ),
                  child: const Icon(Icons.arrow_back_ios_rounded, color: Colors.red),
                ),
              ),
            ),
          ),
          Expanded(
            child: PageView.builder(
              padEnds: false,
              controller: screenController.newsFeedPageController,
              onPageChanged: screenController.selectedPageIndex,
              itemCount: /*screenController.serviceLists.length*/5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Stack(
                        // alignment: Alignment.bottomRight,
                        children: [
                          Column(
                            children: [
                              Expanded(
                                flex: 60,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: const DecorationImage(
                                        image: AssetImage(AppImages.banner2Img),
                                        fit: BoxFit.cover,
                                      )
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 40,
                                child: Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: Column(
                                    children: [
                                      const Text(
                                        '1547, lorem Ipsum is simply dummy text of the printing and typesetting industry',
                                        maxLines: 2,
                                        style: TextStyle(fontSize: 11),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Row(
                                        children: const [
                                          Text(
                                            'Distance - ',
                                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                          ),
                                          Text('2.5 Km', style: TextStyle(fontSize: 12),),
                                        ],
                                      ),
                                      Row(
                                        children: const [
                                          Text(
                                            'Time - ',
                                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                          ),
                                          Text('12min', style: TextStyle(fontSize: 12),),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // Positioned(
                          //   bottom: 10,
                          //   right: 10,
                          //   child: Image.asset(AppImages.arrow, scale: 1.8),
                          // ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // const SizedBox(width: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: GestureDetector(
              onTap: () => screenController.forwardClick(),
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.red),
                  ),
                  child: const Icon(Icons.arrow_forward_ios_rounded, color: Colors.red),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
