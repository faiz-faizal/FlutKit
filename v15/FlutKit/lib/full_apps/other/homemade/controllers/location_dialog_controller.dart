import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationDialogController extends GetxController {
  bool showLoading = true, uiLoading = true;
  late TextEditingController searchEditingController;

  @override
  void onInit() {
    // super.save = false;
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    searchEditingController = TextEditingController();
    await Future.delayed(Duration(seconds: 1));

    showLoading = false;
    uiLoading = false;
    update();
  }

  void confirm() {
    Get.back();
    // Navigator.pop(context);
  }
}
