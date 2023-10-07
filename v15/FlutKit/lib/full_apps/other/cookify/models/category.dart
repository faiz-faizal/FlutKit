import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class Category {
  final IconData icon;
  final String title;

  Category(this.icon, this.title);

  static List<Category> getList() {
    return [
      Category(LucideIcons.chefHat, "All"),
      Category(LucideIcons.cupSoda, "Fast-food"),
      Category(LucideIcons.pizza, "Pizza"),
      Category(LucideIcons.cake, "Cake"),
      Category(LucideIcons.cookie, "Sea Food"),
      Category(LucideIcons.coffee, "Tea"),
    ];
  }
}
