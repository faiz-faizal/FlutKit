import 'package:flutkit/full_apps/animations/shopping_manager/shopping_cache.dart';
import 'package:flutkit/full_apps/animations/shopping_manager/views/forgot_password_screen.dart';
import 'package:flutkit/full_apps/animations/shopping_manager/views/full_app.dart';
import 'package:flutkit/full_apps/animations/shopping_manager/views/register_screen.dart';
import 'package:flutkit/helpers/utils/my_string_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool enable = false;
  @override
  void onInit() {
    // save = false;
    emailController = TextEditingController(text: 'flutkit@coderthemes.com');
    passwordController = TextEditingController(text: 'password');
    fetchData();
    super.onInit();
  }

  fetchData() async {
    await ShoppingCache.initDummy();
  }

  String? validateEmail(String? text) {
    if (text == null || text.isEmpty) {
      return "Please enter email";
    } else if (!MyStringUtils.isEmail(text)) {
      return "Please enter valid email";
    }
    return null;
  }

  String? validatePassword(String? text) {
    if (text == null || text.isEmpty) {
      return "Please enter password";
    } else if (!MyStringUtils.validateStringRange(text, 6, 10)) {
      return "Password must be between 6 to 10";
    }
    return null;
  }

  void toggle() {
    enable = !enable;
    update();
  }

  void goToRegisterScreen() {
    Get.off(RegisterScreen());
    // Navigator.of(context, rootNavigator: true).pushReplacement(
    //   MaterialPageRoute(
    //     builder: (context) => RegisterScreen(),
    //   ),
    // );
  }

  void goToForgotPasswordScreen() {
    Get.off(ForgotPasswordScreen());
    // Navigator.of(context, rootNavigator: true).pushReplacement(
    //   MaterialPageRoute(
    //     builder: (context) => ForgotPasswordScreen(),
    //   ),
    // );
  }

  void login() {
    if (formKey.currentState!.validate()) {
      Get.off(ShoppingManagerFullApp());
      // Navigator.of(context, rootNavigator: true).pushReplacement(
      //   MaterialPageRoute(
      //     builder: (context) => ShoppingManagerFullApp(),
      //   ),
      // );
    }
  }
}
