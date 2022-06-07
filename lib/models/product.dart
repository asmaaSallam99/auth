import 'package:flutter/foundation.dart';

class Product {
  int id;
  String name;
  String nameAr;
  String image;
  double price;
  int category_id;

  Product({
    required this.id,
    required this.name,
    required this.nameAr,
    required this.price,
    required this.image,
    required this.category_id,
  });
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        name: json['name'],
        nameAr: json['nameAr'],
        image: json['image'],
        price: json['price'] * 1.0,
        category_id: json['category_id']);
  }
}
