import 'package:flutkit/full_apps/m3/estate/models/category.dart';
import 'package:flutkit/full_apps/m3/estate/models/house.dart';
import 'package:flutkit/full_apps/m3/estate/views/single_estate_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  bool showLoading = true, uiLoading = true;

  List<Category>? categories;

  List<House>? houses;
  List selectedBedRooms = [];
  List selectedBathRooms = [];
  var selectedRange = RangeValues(200, 800);

  @override
  void onInit() {
    // super.save = false;
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    await Future.delayed(Duration(seconds: 1));

    categories = Category.categoryList();
    houses = await House.getDummyList();

    showLoading = false;
    uiLoading = false;
    update();
  }

  void goToSingleHouseScreen(House house) {
    Get.to(SingleEstateScreen(house));
    // Navigator.of(context, rootNavigator: true).push(
    //     MaterialPageRoute(builder: (context) => SingleEstateScreen(house)));
  }
}
