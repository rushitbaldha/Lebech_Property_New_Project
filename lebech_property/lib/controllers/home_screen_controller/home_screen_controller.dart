import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lebech_property/common/app_images.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeScreenController extends GetxController {
  final TextEditingController searchFieldController = TextEditingController();
  List<String> bannerLists = [(AppImages.banner1Img), (AppImages.banner2Img)];
  RxInt activeBannerIndex = 0.obs;
  YoutubePlayerController? youtubePlayerController;
  String ytUrl = "https://www.youtube.com/watch?v=462shM6Uoeg";
  final newsFeedPageController = PageController();
  RxInt selectedPageIndex = 0.obs;
  List<String> serviceLists = [];


  /// Get Youtube Video URL
  void runYoutubeVideo({required String ytLink}) {
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(ytLink)!,
      flags: const YoutubePlayerFlags(
        enableCaption: false,
        isLive: false,
        autoPlay: false,
      ),
    );
  }

  previousClick() {
    newsFeedPageController.previousPage(duration: 1000.milliseconds, curve: Curves.ease);
  }

  forwardClick() {
    newsFeedPageController.nextPage(duration: 1000.milliseconds, curve: Curves.ease);
  }

  @override
  void onInit() {
    runYoutubeVideo(ytLink: ytUrl);
    super.onInit();
  }

}