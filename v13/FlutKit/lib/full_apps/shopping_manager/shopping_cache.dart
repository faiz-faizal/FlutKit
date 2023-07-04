import 'model/order.dart';
import 'model/product.dart';

class ShoppingCache {
  static List<Product>? products;
  static List<Order>? orders;

  static String deliveryBoyIcon =
      'assets/images/full_apps/shopping/delivery_boy_pin.png';
  static String shopIcon = 'assets/images/full_apps/shopping/shop_pin.png';
  static String deliveryIcon =
      'assets/images/full_apps/shopping/delivery_pin.png';

  static String lightMap =
      'assets/images/full_apps/shopping/map_light_style.json';
  static String darkMap =
      'assets/images/full_apps/shopping/map_dark_style.json';

  static Future<void> initDummy() async {
    ShoppingCache.products = await Product.getDummyList();
    ShoppingCache.orders = await Order.getDummyList();
  }
}
