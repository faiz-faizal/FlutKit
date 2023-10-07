import 'package:boxicons/boxicons.dart';
import 'package:flutkit/full_apps/m3/learning/views/lecture_timetable_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavItem {
  final String title;
  final IconData activeIconData, inactiveIconData;

  NavItem(this.title, this.activeIconData, this.inactiveIconData);
}

class FullAppController extends GetxController {
  int currentIndex = 0;
  int pages = 4;
  late TabController tabController;

  final TickerProvider tickerProvider;

  late List<NavItem> navItems;

  FullAppController(this.tickerProvider) {
    tabController =
        TabController(length: pages, vsync: tickerProvider, initialIndex: 0);
    navItems = [
      NavItem('Home', Boxicons.bxs_home, Boxicons.bx_home),
      NavItem('Explore', Boxicons.bxs_book_open, Boxicons.bx_book_open),
      NavItem('Chat', Boxicons.bxs_chat, Boxicons.bx_chat),
      NavItem('Profile', Boxicons.bxs_user, Boxicons.bx_user),
    ];
  }

  @override
  void onInit() {
    super.onInit();
    tabController.addListener(handleTabSelection);
    tabController.animation!.addListener(() {
      final aniValue = tabController.animation!.value;
      if (aniValue - currentIndex > 0.5) {
        currentIndex++;
        update();
      } else if (aniValue - currentIndex < -0.5) {
        currentIndex--;
        update();
      }
    });
  }

  void changePage(int index) {
    tabController.animateTo(index);
  }

  void goToSetting() {
    changePage(3);
  }

  void goToTimeTable() {
    Get.to(LectureTimeTableScreen());
    // Navigator.of(context, rootNavigator: true).push(
    //     MaterialPageRoute(builder: (context) => LectureTimeTableScreen()));
  }

  handleTabSelection() {
    currentIndex = tabController.index;
    update();
  }
}
