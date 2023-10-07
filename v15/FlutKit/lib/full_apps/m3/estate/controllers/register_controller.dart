import 'package:flutkit/full_apps/m3/estate/views/full_app_screen.dart';
import 'package:flutkit/full_apps/m3/estate/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  late TextEditingController nameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  bool showPassword = false;

  void onChangeShowPassword() {
    showPassword = !showPassword;
    update();
  }

  void goToHomeScreen() {
    Get.off(FullAppScreen());
    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(builder: (context) => FullAppScreen()),
    // );
  }

  void goToLoginScreen() {
    Get.off(LoginScreen());
    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(builder: (context) => LoginScreen()),
    // );
  }
}
