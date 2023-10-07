import 'package:flutkit/full_apps/m3/estate/views/forgot_password_screen.dart';
import 'package:flutkit/full_apps/m3/estate/views/full_app_screen.dart';
import 'package:flutkit/full_apps/m3/estate/views/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInController extends GetxController {
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  void goToForgotPasswordScreen() {
    Get.off(ForgotPasswordScreen());
    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
    // );
  }

  void goToRegisterScreen() {
    Get.off(RegisterScreen());
    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(builder: (context) => RegisterScreen()),
    // );
  }

  void goToHomeScreen() {
    Get.to(FullAppScreen());
    // Navigator.of(context).push(
    //   MaterialPageRoute(builder: (context) => FullAppScreen()),
    // );
  }

  bool showPassword = false;

  void onChangeShowPassword() {
    showPassword = !showPassword;
    update();
  }
}
