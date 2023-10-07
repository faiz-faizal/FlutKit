import 'package:flutkit/full_apps/other/dating/views/home_screen.dart';
import 'package:get/get.dart';

class DatingSplashController extends GetxController {
  void goToHomeScreen() {
    Get.to(DatingHomeScreen());
  }
}
