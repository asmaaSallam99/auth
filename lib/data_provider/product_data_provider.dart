import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:homz/models/product.dart';

class ProductsDataProvider {
  Future<List<product>> getAllProducts() async {
    final jsonDataString =
        await rootBundle.loadString('assets/mocks/products.json');
    final parsed = jsonDecode(jsonDataString)['content'] as List;
    List<product> rawList = parsed.map((e) => product.fromJson(e)).toList();
    return rawList;
  }

  Future<List<product>> getProductsByCategory(int categoryId) async {
    final jsonDataString =
        await rootBundle.loadString('assets/mocks/products.json');
    final parsed = jsonDecode(jsonDataString)['content'] as List;
    List<product> rawList = parsed.map((e) {
      return product.fromJson(e);
    }).toList();
    List<product> filtered = [];
    for (var e in rawList) {
      if (e.category_id == categoryId) filtered.add(e);
    }
    return filtered;
  }
}
