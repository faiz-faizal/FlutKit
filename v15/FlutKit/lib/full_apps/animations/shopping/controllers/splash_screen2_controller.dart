import 'package:flutkit/full_apps/animations/shopping/models/cart.dart';
import 'package:flutkit/full_apps/animations/shopping/models/category.dart';
import 'package:flutkit/full_apps/animations/shopping/models/product.dart';
import 'package:flutkit/full_apps/animations/shopping/shopping_constants.dart';
import 'package:flutkit/full_apps/animations/shopping/views/full_app.dart';
import 'package:get/get.dart';

class SplashScreen2Controller extends GetxController {
  @override
  void onInit() {
    goToFullApp();
    super.onInit();
  }

  goToFullApp() async {
    ShoppingCache.products = await Product.getDummyList();
    ShoppingCache.categories = await Category.getDummyList();
    ShoppingCache.carts = await Cart.getDummyList();
    await Future.delayed(Duration(seconds: 1));

    Get.off(FullApp()
        // PageRouteBuilder(
        //     transitionDuration: Duration(seconds: 2),
        //     pageBuilder: (_, __, ___) => FullApp()),
        );
    // Navigator.of(context, rootNavigator: true).pushReplacement(
    //   PageRouteBuilder(
    //       transitionDuration: Duration(seconds: 2),
    //       pageBuilder: (_, __, ___) => FullApp()),
    // );
  }
}
