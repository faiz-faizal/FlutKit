import 'package:get/get.dart';

import 'package:flutkit/full_apps/other/muvi/views/forgot_password_screen.dart';
import 'package:flutkit/full_apps/other/muvi/views/full_app.dart';
import 'package:flutkit/full_apps/other/muvi/views/login_screen.dart';

class RegisterController extends GetxController {
  bool showLoading = true, uiLoading = true;
  bool selected = true;

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

  void toggleSelect() {
    selected = !selected;
    update();
  }

  void goToForgotPasswordScreen() {
    Get.to(ForgotPasswordScreen());
    // Navigator.push(context,
    //     MaterialPageRoute(builder: (context) => ForgotPasswordScreen()));
  }

  void goToLoginScreen() {
    Get.to(LoginScreen());
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  void signIn() {
    Get.to(FullApp());
    // Navigator.push(context, MaterialPageRoute(builder: (context) => FullApp()));
  }
}
