import 'package:flutter/material.dart';
import 'package:homz/models/Product.dart';

enum FileType {
  local,
  network,
}

class CustomFile {
  final FileType fileType;
  final String path;

  CustomFile({this.fileType = FileType.local, @required this.path});

  @override
  String toString() {
    return "Instance of Custom File: {fileType: $fileType, path: $path}";
  }
}

class ProductDetails extends ChangeNotifier {
  List<CustomFile> _selectedImages = <CustomFile>[];
  CustomFile _selectedModelSrc, _selectedModelTexture;

  ProductType _productType;
  List<String> _searchTags = <String>[];

  List<CustomFile> get selectedImages {
    return _selectedImages;
  }

  CustomFile get selectedModelSrc {
    return _selectedModelSrc;
  }

  CustomFile get selectedModelTexture {
    return _selectedModelTexture;
  }

  set initialSelectedImages(List<CustomFile> images) {
    _selectedImages = images;
  }

  set selectedImages(List<CustomFile> images) {
    _selectedImages = images;
    notifyListeners();
  }

  set selectedModelSrc(CustomFile ModelSrc) {
    _selectedModelSrc = ModelSrc;
    notifyListeners();
  }

  set selectedModelTexture(CustomFile ModelTexture) {
    _selectedModelTexture = ModelTexture;
    notifyListeners();
  }

  void setSelectedImageAtIndex(CustomFile image, int index) {
    if (index < _selectedImages.length) {
      _selectedImages[index] = image;
      notifyListeners();
    }
  }

  void addNewSelectedImage(CustomFile image) {
    _selectedImages.add(image);
    notifyListeners();
  }

  ProductType get productType {
    return _productType;
  }

  set initialProductType(ProductType type) {
    _productType = type;
  }

  set productType(ProductType type) {
    _productType = type;
    notifyListeners();
  }

  List<String> get searchTags {
    return _searchTags;
  }

  set searchTags(List<String> tags) {
    _searchTags = tags;
    notifyListeners();
  }

  set initSearchTags(List<String> tags) {
    _searchTags = tags;
  }

  void addSearchTag(String tag) {
    _searchTags.add(tag);
    notifyListeners();
  }

  void removeSearchTag({int index}) {
    if (index == null)
      _searchTags.removeLast();
    else
      _searchTags.removeAt(index);
    notifyListeners();
  }
}
