import 'package:flutkit/full_apps/other/homemade/views/full_app.dart';
import 'package:flutkit/full_apps/other/homemade/views/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  late TextEditingController emailController = TextEditingController();

  void forgotPassword() {
    Get.to(FullApp());
    // Navigator.of(context, rootNavigator: true).push(
    //   MaterialPageRoute(builder: (context) => FullApp()),
    // );
  }

  void goToRegister() {
    Get.to(RegisterScreen());
    // Navigator.of(context, rootNavigator: true).push(
    //   MaterialPageRoute(builder: (context) => RegisterScreen()),
    // );
  }
}
