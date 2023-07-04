import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/full_apps/shopping_manager/shopping_cache.dart';
import 'package:flutkit/full_apps/shopping_manager/views/order_screen.dart';
import 'package:flutkit/theme/constant.dart';

import '../model/order.dart';

enum OrderViewType { active, past }

class OrdersController extends FxController {
  late OrderViewType viewType;
  late List<Order> orders;

  OrdersController() {
    viewType = OrderViewType.active;
    orders = ShoppingCache.orders!;
  }

  void changeOrderView(OrderViewType viewType) {
    this.viewType = viewType;
    update();
  }

  String getTextFromStatus(int status) {
    if (status == 1) {
      return "On the way";
    } else if (status == 2) {
      return "Need confirmation";
    } else if (status == 3) {
      return "Await for payment";
    }
    return "Processing";
  }

  ColorGroup getColorFromStatus(int status) {
    if (status == 1) {
      return Constant.softColors.green;
    } else if (status == 2) {
      return Constant.softColors.blue;
    } else if (status == 3) {
      return Constant.softColors.violet;
    }
    return Constant.softColors.orange;
  }

  void goToOrder(Order order) {
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (context) => OrderScreen(order),
      ),
    );
  }

  @override
  String getTag() {
    return "orders_controller";
  }
}
