import 'package:flutkit/full_apps/other/estate/models/category.dart';
import 'package:flutkit/full_apps/other/estate/models/house.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EstateHomeController extends GetxController {
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
    houses = House.houseList();

    showLoading = false;
    uiLoading = false;
    update();
  }
}
