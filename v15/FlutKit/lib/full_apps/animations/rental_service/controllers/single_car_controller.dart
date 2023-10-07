import 'package:flutkit/full_apps/animations/rental_service/models/car.dart';
import 'package:flutkit/full_apps/animations/rental_service/views/payment_screen.dart';
import 'package:get/get.dart';

class SingleCarController extends GetxController {
  Car car;

  SingleCarController(this.car);

  bool fav = false;

  @override
  void onInit() {
    // save = false;
    super.onInit();
  }

  void toggleFav() {
    fav = !fav;
    update();
  }

  void goToPaymentScreen() {
    Get.off(PaymentScreen());
    // Navigator.of(context, rootNavigator: true).pushReplacement(
    //   MaterialPageRoute(
    //     builder: (context) => PaymentScreen(),
    //   ),
    // );
  }

  void goBack() {
    Get.back();
    // Navigator.pop(context);
  }
}
