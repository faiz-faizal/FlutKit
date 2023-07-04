import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../model/product.dart';
import '../shopping_cache.dart';
import '../views/product_screen.dart';

enum ProductViewType { grid, list }

class ProductsController extends FxController {
  late ProductViewType viewType;
  late List<Product> products;

  ProductsController() {
    viewType = ProductViewType.grid;
    products = ShoppingCache.products!;
  }

  void changeProductView(ProductViewType viewType) {
    this.viewType = viewType;
    update();
  }

  void goToProduct(Product product) {
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (context) => ProductScreen(product),
      ),
    );
  }

  @override
  String getTag() {
    return "products_controller";
  }
}
