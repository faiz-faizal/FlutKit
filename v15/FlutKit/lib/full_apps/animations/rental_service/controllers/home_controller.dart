import 'package:flutkit/full_apps/animations/rental_service/models/car.dart';
import 'package:flutkit/full_apps/animations/rental_service/rental_service_cache.dart';
import 'package:flutkit/full_apps/animations/rental_service/views/single_car_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Category {
  String name, image;

  Category(this.name, this.image);
}

class HomeController extends GetxController {
  TextEditingController searchController = TextEditingController();
  List<Category> categories = [];
  List<Car> cars = [];

  @override
  void onInit() {
    categories = [
      Category("BMW", "assets/images/full_apps/rental_service/icons/logo1.png"),
      Category("Kia", "assets/images/full_apps/rental_service/icons/logo7.png"),
      Category(
          "Ferrari", "assets/images/full_apps/rental_service/icons/logo3.png"),
      Category(
          "Ford", "assets/images/full_apps/rental_service/icons/logo6.png"),
      Category(
          "Opel", "assets/images/full_apps/rental_service/icons/logo2.png"),
      Category(
          "Porsche", "assets/images/full_apps/rental_service/icons/logo5.png"),
    ];
    cars = RentalServiceCache.cars;
    super.onInit();
  }

  void goToSingleCarScreen(Car car) {
    Get.to(
      SingleCarScreen(car: car),
    );
    // Navigator.of(context, rootNavigator: true).push(
    //   MaterialPageRoute(
    //     builder: (context) => SingleCarScreen(
    //       car: car,
    //     ),
    //   ),
    // );
  }
}
