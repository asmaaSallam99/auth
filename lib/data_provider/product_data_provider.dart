import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:homz/models/product.dart';

class ProductsDataProvider {
  Future<List<Product>> getAllProducts() async {
    final jsonDataString =
        await rootBundle.loadString('assets/mocks/products.json');
    final parsed = jsonDecode(jsonDataString)['content'] as List;
    List<Product> rawList = parsed.map((e) => Product.fromJson(e)).toList();
    return rawList;
  }

  Future<List<Product>> getProductsByCategory(int categoryId) async {
    final jsonDataString =
        await rootBundle.loadString('assets/mocks/products.json');
    final parsed = jsonDecode(jsonDataString)['content'] as List;
    List<Product> rawList = parsed.map((e) {
      return Product.fromJson(e);
    }).toList();
    List<Product> filtered = [];
    for (var e in rawList) {
      if (e.category_id == categoryId) filtered.add(e);
    }
    return filtered;
  }
}
