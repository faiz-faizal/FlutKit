import 'package:get/get.dart';

enum ShopStatus { close, open }

class ProfileController extends GetxController {
  late ShopStatus shopStatus;

  ProfileController() {
    shopStatus = ShopStatus.open;
  }

  void changeShopStatus(ShopStatus shopStatus) {
    this.shopStatus = shopStatus;
    update();
  }

  void logout() {
    Get.back();
    // Navigator.pop(context);
  }
}
