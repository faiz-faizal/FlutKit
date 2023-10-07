import 'package:flutkit/full_apps/animations/rental_service/models/car.dart';
import 'package:flutkit/full_apps/animations/rental_service/rental_service_cache.dart';
import 'package:flutkit/full_apps/animations/rental_service/views/single_car_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CollectionController extends GetxController {
  List<Car> cars = [];
  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    cars = RentalServiceCache.cars;
    super.onInit();
  }

  void goToSingleCarScreen(Car car) {
    Get.to(
      SingleCarScreen(
        car: car,
      ),
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
