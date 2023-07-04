import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutkit/extensions/extensions.dart';

class Product {
  final String name, image, description;
  final double price, rating;
  final int ratingCount, quantity;

  Product(this.name, this.description, this.image, this.price, this.rating,
      this.ratingCount, this.quantity);

  static Future<List<Product>> getDummyList() async {
    dynamic data = json.decode(await getData());
    return getListFromJson(data);
  }

  static Future<Product> getOne() async {
    return (await getDummyList())[0];
  }

  static Future<Product> fromJson(Map<String, dynamic> jsonObject) async {
    String name = jsonObject['name'].toString();
    String image = jsonObject['image'].toString();
    String description = jsonObject['description'].toString();

    double price = jsonObject['price'].toString().toDouble(0);
    double rating = jsonObject['rating'].toString().toDouble(0);

    int ratingCount = jsonObject['rating_count'].toString().toInt(0);
    int quantity = jsonObject['quantity'].toString().toInt(0);

    return Product(
        name, description, image, price, rating, ratingCount, quantity);
  }

  static Future<List<String>> getImages(List<dynamic> jsonArray) async {
    List<String> list = [];
    for (int i = 0; i < jsonArray.length; i++) {
      list.add(jsonArray[i]);
    }
    return list;
  }

  static Future<List<Product>> getListFromJson(List<dynamic> jsonArray) async {
    List<Product> list = [];
    for (int i = 0; i < jsonArray.length; i++) {
      list.add(await Product.fromJson(jsonArray[i]));
    }
    return list;
  }

  static Future<String> getData() async {
    return await rootBundle
        .loadString('lib/full_apps/shopping_manager/data/products.json');
  }
}
