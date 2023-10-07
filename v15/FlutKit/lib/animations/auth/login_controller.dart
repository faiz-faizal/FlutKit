import 'package:flutkit/animations/auth/teddy_controller.dart';
import 'package:flutkit/helpers/utils/info_controller.dart';
import 'package:flutkit/helpers/utils/my_string_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInController extends GetxController {
  LogInController();

  late TextEditingController emailTE, passwordTE;
  GlobalKey<FormState> formKey = GlobalKey();
  late TeddyController teddyController;
  late final FocusNode emailNode, passwordNode;

  @override
  void onInit() {
    super.onInit();
    emailTE = TextEditingController(text: 'flutkit@coderthemes.com');
    passwordTE = TextEditingController(text: 'password');
    teddyController = TeddyController();
    emailNode = FocusNode();
    passwordNode = FocusNode();
    initFocusNode();
  }

  initFocusNode() {
    emailNode.addListener(() {
      if (emailNode.hasFocus) {
        teddyController.coverEyes(false);
      }
    });
    passwordNode.addListener(() {
      if (passwordNode.hasFocus) {
        teddyController.coverEyes(true);
      }
    });
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
    } else if (!MyStringUtils.validateStringRange(
      text,
    )) {
      return "Password length must between 8 and 20";
    }
    return null;
  }

  void onCaretMoved(Offset? offset) {
    teddyController.lookAt(offset);
  }

  void login() {
    if (formKey.currentState!.validate()) {
      // teddyController.coverEyes(false);
      teddyController.setSuccess();
      Info.message("Login success", context: Get.context);
    } else {
      teddyController.setFail();
      Info.error("Login failed", context: Get.context);
    }
  }
}
