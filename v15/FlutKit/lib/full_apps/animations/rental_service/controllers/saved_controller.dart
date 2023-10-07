import 'package:flutkit/full_apps/animations/rental_service/models/car.dart';
import 'package:flutkit/full_apps/animations/rental_service/rental_service_cache.dart';
import 'package:flutkit/full_apps/animations/rental_service/views/single_car_screen.dart';
import 'package:get/get.dart';

class SavedController extends GetxController {
  List<Car> cars = [];

  @override
  void onInit() {
    cars = RentalServiceCache.cars;
    super.onInit();
  }

  double findAspectRatio() {
    double width = Get.width;
    // double width = MediaQuery.of(context).size.width;
    return ((width - 60) / 2) / (90 * 2);
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
