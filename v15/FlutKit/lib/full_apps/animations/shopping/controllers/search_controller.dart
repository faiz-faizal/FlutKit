import 'package:flutkit/full_apps/animations/shopping/models/product.dart';
import 'package:flutkit/full_apps/animations/shopping/shopping_constants.dart';
import 'package:flutkit/full_apps/animations/shopping/views/single_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  TickerProvider ticker;
  SearchController(this.ticker);
  List<Product>? products;
  bool showLoading = true, uiLoading = true;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> selectedChoices = [];
  RangeValues selectedRange = RangeValues(200, 800);
  late AnimationController animationController;
  late Animation<double> fadeAnimation;

  List<String> categoryList = [
    "T-Shirt",
    "Shirts",
    "Jeans",
    "Pants",
    "Men's wear",
    "Women's wear",
    "Nightdress",
    "Underwear",
    "Food",
    "Electronics",
    "Tech",
    "Other",
  ];

  @override
  void onInit() {
    fetchData();
    animationController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: ticker,
    );
    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeIn,
      ),
    );
    animationController.forward();
    super.onInit();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  double findAspectRatio() {
    double width = Get.width;
    // double width = MediaQuery.of(context).size.width;
    return ((width - 58) / 2) / (250);
  }

  void goToProductScreen(Product product) {
    Get.to(
      SingleProductScreen(product),
      duration: Duration(seconds: 1),
    );
  }

  void fetchData() async {
    products = ShoppingCache.products;
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
}
