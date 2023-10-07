import 'package:flutkit/full_apps/other/homemade/models/shop.dart';
import 'package:flutkit/full_apps/other/homemade/views/location_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  bool showLoading = true, uiLoading = true;

  List<Shop> shops = [];

  late TextEditingController searchEditingController;
  late TextEditingController locationEditingController;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> selectedChoices = [];
  RangeValues selectedRange = RangeValues(200, 800);

  @override
  void onInit() {
    getList();
    super.onInit();
  }

  void getList() async {
    searchEditingController = TextEditingController();
    locationEditingController = TextEditingController();
    await Future.delayed(Duration(seconds: 1));
    shops = await Shop.getDummyList();

    showLoading = false;
    uiLoading = false;
    update();
  }

  void openEndDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
  }

  void closeEndDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  void addChoice(String item) {
    selectedChoices.add(item);
    update();
  }

  void removeChoice(String item) {
    selectedChoices.remove(item);
    update();
  }

  void onChangePriceRange(RangeValues newRange) {
    selectedRange = newRange;
    update();
  }

  void openLocationDialog() {
    Get.dialog(LocationDialog());
    // showDialog(
    //     context: context, builder: (BuildContext context) => LocationDialog());
  }
}
