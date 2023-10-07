import 'package:get/get.dart';

class SwitchController extends GetxController {
  SwitchController();

  String status = "Off";
  bool toggleValue = false;

  void onClick() {
    if (status.compareTo("Off") == 0) {
      status = "On";
      update();
    } else {
      status = "Off";
      update();
    }
  }

  void goBack() {
    Get.back();
    // Navigator.pop(context);
  }

  toggleButton() {
    toggleValue = !toggleValue;
    update();
  }
}
