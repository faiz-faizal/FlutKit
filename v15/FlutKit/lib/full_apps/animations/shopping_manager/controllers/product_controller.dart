import 'package:flutkit/full_apps/animations/shopping_manager/model/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final Product product;
  final TextEditingController nameTE = TextEditingController();
  final TextEditingController descriptionTE = TextEditingController();
  final TextEditingController priceTE = TextEditingController();
  int quantity = 0;
  bool agreementChecked = false;

  ProductController(this.product) {
    // save = false;
    quantity = product.quantity;
  }
  @override
  void onInit() {
    nameTE.text = (product.name);
    descriptionTE.text = product.description;
    priceTE.text = product.price.toString();
    super.onInit();
  }

  bool isQuanIncreasable() {
    return true;
  }

  bool isQuanDecreable() {
    return quantity > 0;
  }

  void increaseQuan() {
    quantity++;
    update();
  }

  void decreaseQuan() {
    if (isQuanDecreable()) {
      quantity--;
      update();
    }
  }

  void toggleAgreement() {
    agreementChecked = !agreementChecked;
    update();
  }

  void goBack() {
    Get.back();
    // Navigator.pop(context);
  }
}
