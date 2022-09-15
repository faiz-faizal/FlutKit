import 'package:flutter/material.dart';
import 'package:flutkit/extensions/extensions.dart';

class Category {
  String name;
  IconData icon;

  Category(this.name, this.icon);

  static List<Category> categoryList() {
    List<Category> list = [];
    list.add(Category("see_all".tr(), Icons.grid_view));
    list.add(Category("furniture".tr(), Icons.chair));
    list.add(Category("electricity".tr(), Icons.bolt));
    list.add(Category("promo".tr(), Icons.local_offer));
    list.add(Category("automotive".tr(), Icons.local_taxi));
    list.add(Category("wallet".tr(), Icons.account_balance_wallet));
    list.add(Category("gadget".tr(), Icons.devices_other));
    list.add(Category("travel".tr(), Icons.flight));
    return list;
  }
}
