import 'package:flutkit/full_apps/m3/homemade/views/forgot_password_screen.dart';
import 'package:flutkit/full_apps/m3/homemade/views/full_app.dart';
import 'package:flutkit/full_apps/m3/homemade/views/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInController extends GetxController {
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  void login() {
    Get.off(FullApp());
    // Navigator.of(context, rootNavigator: true).pushReplacement(
    //   MaterialPageRoute(builder: (context) => FullApp()),
    // );
  }

  void goToForgotPassword() {
    Get.off(ForgotPasswordScreen());
    // Navigator.of(context, rootNavigator: true).pushReplacement(
    //   MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
    // );
  }

  void goToRegister() {
    Get.to(RegisterScreen());
    // Navigator.of(context, rootNavigator: true).push(
    //   MaterialPageRoute(builder: (context) => RegisterScreen()),
    // );
  }
}
