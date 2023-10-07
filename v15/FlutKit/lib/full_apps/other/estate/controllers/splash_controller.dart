import 'package:flutkit/full_apps/other/estate/views/login_screen.dart';
import 'package:flutkit/full_apps/other/estate/views/search_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  void goToSearchScreen() {
    Get.to(EstateSearchScreen());
    // Navigator.of(context, rootNavigator: true).push(
    //   MaterialPageRoute(builder: (context) => EstateSearchScreen()),
    // );
  }

  void goToLogin() {
    Get.to(EstateLoginScreen());
    // Navigator.of(context, rootNavigator: true).push(
    //   MaterialPageRoute(builder: (context) => EstateLoginScreen()),
    // );
  }
}
