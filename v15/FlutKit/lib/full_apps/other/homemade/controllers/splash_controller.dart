import 'package:flutkit/full_apps/other/homemade/views/login_screen.dart';
import 'package:flutkit/full_apps/other/homemade/views/register_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  void goToLogin() {
    Get.to(LogInScreen());
    // Navigator.of(context, rootNavigator: true).push(
    //   MaterialPageRoute(builder: (context) => LogInScreen()),
    // );
  }

  void goToRegister() {
    Get.to(RegisterScreen());
    // Navigator.of(context, rootNavigator: true).push(
    //   MaterialPageRoute(builder: (context) => RegisterScreen()),
    // );
  }
}
