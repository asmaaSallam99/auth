import 'package:flutter/foundation.dart';

class product {
  int id;
  String name;
  String nameAr;
  String image;
  double price;
  int category_id;

  product({
    required this.id,
    required this.name,
    required this.nameAr,
    required this.price,
    required this.image,
    required this.category_id,
  });
  factory product.fromJson(Map<String, dynamic> json) {
    return product(
        id: json['id'],
        name: json['name'],
        nameAr: json['nameAr'],
        image: json['image'],
        price: json['price'] * 1.0,
        category_id: json['category_id']);
  }
}
