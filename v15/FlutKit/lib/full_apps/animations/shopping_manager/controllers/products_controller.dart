import 'package:flutkit/full_apps/animations/shopping_manager/model/product.dart';
import 'package:flutkit/full_apps/animations/shopping_manager/shopping_cache.dart';
import 'package:flutkit/full_apps/animations/shopping_manager/views/product_screen.dart';
import 'package:get/get.dart';

enum ProductViewType { grid, list }

class ProductsController extends GetxController {
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
    Get.to(ProductScreen(product));
    // Navigator.of(context, rootNavigator: true).push(
    //   MaterialPageRoute(
    //     builder: (context) => ProductScreen(product),
    //   ),
    // );
  }
}
