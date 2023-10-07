import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  int currentIndex = 0;

  late TabController tabController;

  final TickerProvider ticker;

  AppController(this.ticker) {
    tabController = TabController(length: 4, vsync: ticker, initialIndex: 0);
  }

  @override
  void onInit() {
    if (tabController.animation != null) {
      tabController.animation!.addListener(() {
        final aniValue = tabController.animation!.value;
        if (aniValue - currentIndex > 0.5) {
          currentIndex = currentIndex + 1;
          update();
        } else if (aniValue - currentIndex < -0.5) {
          currentIndex = currentIndex - 1;
          update();
        }
      });
    }
    super.onInit();
  }

  onTapped(value) {
    tabController.animateTo(value);
  }

  @override
  dispose() {
    tabController.dispose();
    super.dispose();
  }
}
