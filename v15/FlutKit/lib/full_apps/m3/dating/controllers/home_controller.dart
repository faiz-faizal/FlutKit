import 'package:flutkit/full_apps/m3/dating/models/profile.dart';
import 'package:flutkit/full_apps/m3/dating/views/matched_profile_screen.dart';
import 'package:flutkit/full_apps/m3/dating/views/profile_screen.dart';
import 'package:flutkit/full_apps/m3/dating/views/single_chat_screen.dart';
import 'package:flutkit/full_apps/m3/dating/views/single_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  bool showLoading = true, uiLoading = true;

  PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;
  int numPages = 10;
  List<Profile>? profiles;

  @override
  void onInit() {
    super.onInit();
    // super.save = false;
    fetchData();
  }

  nextPage() async {
    if (currentPage == numPages - 1) {
    } else {
      await pageController.animateToPage(
        currentPage + 1,
        duration: Duration(milliseconds: 600),
        curve: Curves.ease,
      );
    }
  }

  void goToMatchedProfileScreen() {
    Get.to(MatchedProfileScreen(profiles![currentPage]));
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) =>
    //             MatchedProfileScreen(profiles![currentPage])));
  }

  void goToSingleChatScreen() {
    Get.to(SingleChatScreen(profiles![currentPage]));
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => SingleChatScreen(profiles![currentPage])));
  }

  void goToProfileScreen() {
    Get.to(ProfileScreen());
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => ProfileScreen()));
  }

  previousPage() async {
    if (currentPage == 1) {
    } else {
      await pageController.animateToPage(
        currentPage - 1,
        duration: Duration(milliseconds: 600),
        curve: Curves.ease,
      );
    }
  }

  onPageChanged(int page, {bool fromUser = false}) async {
    if (!fromUser) currentPage = page;
    update();
    if (fromUser) {
      await pageController.animateToPage(
        page,
        duration: Duration(milliseconds: 600),
        curve: Curves.ease,
      );
    }
  }

  void goToSingleProfileScreen(Profile profile) {
    Get.to(SingleProfileScreen(profile));
    // Navigator.push(context,
    //     MaterialPageRoute(builder: (context) => SingleProfileScreen(profile)));
  }

  @override
  void dispose() {
    if (pageController.hasClients) pageController.dispose();
    super.dispose();
  }

  void fetchData() async {
    profiles = await Profile.getDummyList();

    await Future.delayed(Duration(seconds: 1));

    showLoading = false;
    uiLoading = false;
    update();
  }
}
