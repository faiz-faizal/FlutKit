import 'dart:async';

import 'package:flutkit/animations/resizing_house/house_controller.dart';
import 'package:get/get.dart';

class ResizingHouseController extends GetxController {
  int rooms = 6;
  late HouseController houseController;
  Timer? _currentDemoSchedule;

  ResizingHouseController() {
    houseController = HouseController(
      demoUpdated: update,
    );
  }

  void onSliderChange(double value) {
    houseController.isDemoMode = false;
    rooms = value.toInt() + 3;

    houseController.rooms = rooms;

    if (_currentDemoSchedule != null) {
      _currentDemoSchedule!.cancel();
      _currentDemoSchedule = null;
    }
    update();
  }

  void goBack() {
    Get.back();
    // Navigator.pop(context);
  }
}
