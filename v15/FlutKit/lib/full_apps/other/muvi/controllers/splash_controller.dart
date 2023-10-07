import 'package:flutkit/full_apps/other/muvi/views/login_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  bool showLoading = true, uiLoading = true;
  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    await Future.delayed(Duration(seconds: 1));
    showLoading = false;
    uiLoading = false;
    update();
  }

  void goToLoginScreen() {
    Get.to(LoginScreen());
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
