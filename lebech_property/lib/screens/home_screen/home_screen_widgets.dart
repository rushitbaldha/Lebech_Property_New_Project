import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/common/constants/app_images.dart';
import 'package:lebech_property/controllers/home_screen_controller/home_screen_controller.dart';
import 'package:lebech_property/screens/project_list_screen/project_list_screen.dart';
import 'package:lebech_property/screens/property_details_screen/property_details_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../common/field_decorations.dart';
import '../../models/home_screen_model/home_screen_model.dart';
import '../project_details_screen/project_details_screen.dart';

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
            image: NetworkImage(screenController.bannerLists[index].image),
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
  NewProjectsModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

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
          height: 300,
          child: ListView.builder(
            itemCount: screenController.newProjectsList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              Project singleNewProjectItem = screenController.newProjectsList[i];

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  onTap: () {
                    log("singleNewProjectItem.id : ${singleNewProjectItem.id}");
                    Get.to(
                          () => ProjectDetailsScreen(),
                      transition: Transition.rightToLeft,
                      arguments: singleNewProjectItem.id,
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 80,
                          child: Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.bottomCenter,
                            children: [
                              _imageModule(),

                              Positioned(
                                bottom: -35,
                                child: _propertyDetails(singleNewProjectItem: singleNewProjectItem),
                              ),
                            ],
                          ),
                        ),
                        const Expanded(
                          flex: 20,
                          child: SizedBox(),
                        ),
                      ],
                    ),
                    /*child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 55,
                          child: _imageModule(),
                        ),
                        // const SizedBox(height: 5),
                        Expanded(
                          flex: 45,
                          child: _propertyDetails(singleNewProjectItem: singleNewProjectItem),
                        ),
                      ],
                    ),*/
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
            onTap: () => Get.to(()=> ProjectListScreen(appBarHeading: "New Projects"), transition: Transition.rightToLeft),
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
        ),
      ],
    );
  }

  Widget _imageModule() {
    return Container(
      width: Get.width * 0.80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: const DecorationImage(
          image: AssetImage(AppImages.banner1Img),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _propertyDetails({required Project singleNewProjectItem}) {
    return Container(
      width: Get.width * 0.60,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      child: Column(
        children: [
          const Expanded(
            flex: 25,
            child: SizedBox(),
          ),
          Expanded(
            flex: 75,
            child: Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      singleNewProjectItem.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${singleNewProjectItem.user.name}, ${singleNewProjectItem.area.name}',
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      height: 17,
                      child: ListView.builder(
                        itemCount: singleNewProjectItem.prices.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, i) {
                          return IntrinsicHeight(
                            child: Row(
                              children: [
                                Text(
                                  singleNewProjectItem.prices[i].type,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                                VerticalDivider(),
                              ],
                            ),
                          );
                        },
                      ),
                    ),


                  ],
                ),
                Positioned(
                  top: -52,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(AppImages.banner2Img),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FavouriteProjectsModule extends StatelessWidget {
  FavouriteProjectsModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Favourite Projects',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 180,
          child: ListView.builder(
            itemCount: screenController.favouriteProjectsList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              Project singleFavouriteProjectItem = screenController.favouriteProjectsList[i];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  onTap: ()=> Get.to(()=> PropertyDetailsScreen(),
                    transition: Transition.zoom,
                    arguments: singleFavouriteProjectItem.id.toString(),),
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
                          child: _propertyDetails(singleFavouriteProjectItem: singleFavouriteProjectItem),
                        ),
                      ],
                    ),
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
                'See All Favourite Projects',
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

  Widget _propertyDetails({required Project singleFavouriteProjectItem}) {
    return Container(
      width: 180,
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            singleFavouriteProjectItem.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 5),
          Text(
            '${singleFavouriteProjectItem.user.name}, ${singleFavouriteProjectItem.area.name}',
            maxLines: 1,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            '2 BHK Flat',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 13,
            ),
          ),


        ],
      ),
    );
  }
}

class NewListingsModule extends StatelessWidget {
  NewListingsModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'New Listings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GridView.builder(
            itemCount: screenController.newListingsList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, i){
              Favourite singleListingsItem = screenController.newListingsList[i];
              return GestureDetector(
                onTap: ()=> Get.to(()=> PropertyDetailsScreen(),
                  transition: Transition.zoom,
                  arguments: singleListingsItem.id.toString(),),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 45,
                        child: _imagesListModule(singleListingsItem: singleListingsItem),
                      ),
                      Expanded(
                        flex: 55,
                        child: _propertyDetailsModule(singleListingsItem: singleListingsItem),
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
                'See All New Listings',
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

  Widget _imagesListModule({required Favourite singleListingsItem}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15)
        ),
        image: DecorationImage(
          image: NetworkImage(singleListingsItem.propertyImages[0].image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _propertyDetailsModule({required Favourite singleListingsItem}) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Text(
            singleListingsItem.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            "₹ ${singleListingsItem.rent.rent}",
            maxLines: 1,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.red,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            singleListingsItem.sortDesc,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 3),
          Text(
            '${singleListingsItem.bedrooms}BHK',
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 3),
          Text(
            '${singleListingsItem.propertyTenant.totalCarParking} Car Parking',
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class FeaturedListingsModule extends StatelessWidget {
  FeaturedListingsModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Featured Listings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GridView.builder(
            itemCount: screenController.featuredListingsList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, i){
              Favourite singleFeaturedItem = screenController.featuredListingsList[i];
              return GestureDetector(
                onTap: ()=> Get.to(()=> PropertyDetailsScreen(),
                  transition: Transition.zoom,
                  arguments: singleFeaturedItem.id.toString(),),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 45,
                        child: _imagesListModule(singleFeaturedItem: singleFeaturedItem),
                      ),
                      Expanded(
                        flex: 55,
                        child: _propertyDetailsModule(singleFeaturedItem: singleFeaturedItem),
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
                'See All Featured Listings',
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

  Widget _imagesListModule({required Favourite singleFeaturedItem}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15)
        ),
        image: DecorationImage(
          image: NetworkImage(singleFeaturedItem.propertyImages[0].image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _propertyDetailsModule({required Favourite singleFeaturedItem}) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            singleFeaturedItem.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            "₹ ${singleFeaturedItem.rent.rent}",
            maxLines: 1,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.red,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            singleFeaturedItem.sortDesc,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 3),
          Text(
            '${singleFeaturedItem.bedrooms}BHK',
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 3),
          Text(
            '${singleFeaturedItem.propertyTenant.totalCarParking} Car Parking',
            style: const TextStyle(fontSize: 12),
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
            image: NetworkImage(screenController.bannerLists[index].image),
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
      child: const Text(
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
  AminitiesModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 300,
        child: GridView.builder(
          itemCount: screenController.aminitiesLists.length,
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
            return Stack(
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
                              Text(
                                screenController.aminitiesLists[i],
                                maxLines: 1,
                                style: const TextStyle(
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

