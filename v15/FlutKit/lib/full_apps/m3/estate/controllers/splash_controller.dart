import 'package:flutkit/full_apps/m3/estate/views/login_screen.dart';
import 'package:flutkit/full_apps/m3/estate/views/search_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  void goToSearchScreen() {
    Get.to(SearchScreen());
    // Navigator.of(context, rootNavigator: true).push(
    //   MaterialPageRoute(builder: (context) => SearchScreen()),
    // );
  }

  void goToLogin() {
    Get.to(LoginScreen());
    // Navigator.of(context, rootNavigator: true).push(
    //   MaterialPageRoute(builder: (context) => LoginScreen()),
    // );
  }
}
