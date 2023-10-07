import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_intro/flutter_intro.dart';
import 'package:get/get.dart';

class IntroController extends GetxController {
  late Intro intro;

  @override
  void onInit() {
    intro = Intro(
        stepCount: 4,
        maskClosable: true,
        onHighlightWidgetTap: (introStatus) {},

        /// use defaultTheme
        widgetBuilder: StepWidgetBuilder.useDefaultTheme(
          texts: [
            'Hello, I\'m Flutter Intro.',
            'I can help you quickly implement the Step By Step guide in the Flutter project.',
            'My usage is also very simple, you can quickly learn and use it through example and api documentation.',
            'In order to quickly implement the guidance, I also provide a set of out-of-the-box themes, I wish you all a happy use, goodbye!',
          ],
          buttonTextBuilder: (currPage, totalPage) {
            return currPage < totalPage - 1 ? 'Next' : 'Finish';
          },
        ));
    intro.setStepConfig(0, borderRadius: BorderRadius.circular(64));
    Timer(
      Duration(milliseconds: 500),
      () {
        intro.start(Get.context!);
      },
    );
    super.onInit();
  }

  startIntro() {
    intro.start(Get.context!);
  }

  void goBack() {
    Get.back();
    // Navigator.pop(context);
  }

  Future<bool> onWillPop() async {
    IntroStatus introStatus = intro.getStatus();
    if (introStatus.isOpen) {
      intro.dispose();
      return false;
    }
    return true;
  }
}
