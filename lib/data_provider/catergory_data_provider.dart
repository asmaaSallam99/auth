import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:homz/models/category.dart';

class CategoryDataProvider {
  Future<List> getCategories() async {
    final jsonDataString =
        await rootBundle.loadString('assets/mocks/categories.json');
    final parsed = jsonDecode(jsonDataString)['content'] as List;

    List<Category> rawList = parsed.map((e) => Category.fromJson(e)).toList();
    return _handleCategories(rawList);
  }
}

List<Category> _handleCategories(List<Category> rowCategories) {
  List<Category> categories = [];
  for (Category category in rowCategories) {
    if (category.parentId == null) {
      categories.add(category);
    }
  }

  for (Category category in rowCategories) {
    if (category.parentId != null) {
      Category parent = categories.firstWhere((e) => e.id == category.parentId);
      parent.children ??= List.empty(growable: true);
      parent.children!.add(category);
    }
  }
  return categories;
}
