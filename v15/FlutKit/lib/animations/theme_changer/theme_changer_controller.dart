import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:flutkit/helpers/theme/app_notifier.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/theme/theme_type.dart';

class ThemeChangerController extends GetxController {
  TickerProvider ticker;
  ThemeChangerController(this.ticker);
  late AnimationController scaleController;
  late Animation<double> scaleAnimation;
  @override
  void onInit() {
    scaleController =
        AnimationController(vsync: ticker, duration: Duration(seconds: 1));
    scaleAnimation =
        Tween<double>(begin: 0.0, end: 800.0).animate(scaleController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              changeTheme();
              scaleController.reset();
            }
          });
    super.onInit();
  }

  void changeTheme() {
    if (AppTheme.themeType == ThemeType.light) {
      Provider.of<AppNotifier>(Get.context!, listen: false)
          .updateTheme(ThemeType.dark);
    } else {
      Provider.of<AppNotifier>(Get.context!, listen: false)
          .updateTheme(ThemeType.light);
    }
    update();
  }

  @override
  void dispose() {
    scaleController.dispose();
    super.dispose();
  }
}
