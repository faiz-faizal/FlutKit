import 'package:flutkit/full_apps/m3/learning/views/login_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  void goToLogInScreen() {
    Get.off(LearningLogInScreen());
    // Navigator.of(context, rootNavigator: true).push(
    //   MaterialPageRoute(
    //     builder: (context) => LogInScreen(),
    //   ),
    // );
  }
}
