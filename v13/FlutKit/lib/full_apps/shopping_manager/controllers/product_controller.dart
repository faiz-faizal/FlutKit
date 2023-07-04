import 'package:flutter/cupertino.dart';
import 'package:flutx/flutx.dart';

import '../model/product.dart';

class ProductController extends FxController {
  final Product product;
  final TextEditingController nameTE = TextEditingController();
  final TextEditingController descriptionTE = TextEditingController();
  final TextEditingController priceTE = TextEditingController();
  int quantity = 0;
  bool agreementChecked = false;

  ProductController(this.product) {
    save = false;
    quantity = product.quantity;
  }

  @override
  void initState() {
    super.initState();
    nameTE.text = (product.name);
    descriptionTE.text = product.description;
    priceTE.text = product.price.toString();
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
    Navigator.pop(context);
  }

  @override
  String getTag() {
    return "product_controller";
  }
}
