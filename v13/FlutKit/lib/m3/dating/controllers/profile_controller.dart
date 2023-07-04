import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class ProfileController extends FxController {
  bool showLoading = true, uiLoading = true;

  @override
  initState() {
    super.initState();
    save = false;
    fetchData();
  }

  void fetchData() async {
    showLoading = false;
    uiLoading = false;
    update();
  }

  void goBack() {
    Navigator.pop(context);
  }

  @override
  String getTag() {
    return "profile_controller";
  }
}
