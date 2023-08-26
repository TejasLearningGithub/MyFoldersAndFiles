import 'package:flutter/material.dart';

class Product {
  final String name;
  final List<String> tags;

  Product({required this.name, required this.tags});
}

class ProductsProvider with ChangeNotifier {
  String? mySelectedChip;
  //Product product = Product(name: 'name', tags: ['tags']);
  final List<Product> allProducts = [
    Product(name: 'Product 1', tags: ['Tag 1', 'Tag 2']),
    Product(name: 'Product 2', tags: ['Tag 2', 'Tag 3']),
    Product(name: 'Product 3', tags: ['Tag 1', 'Tag 3']),
    Product(name: 'Product 4', tags: ['Tag 4', 'Tag 1']),
    Product(name: 'Product 5', tags: ['Tag 5', 'Tag 5']),
    // Add more products with their respective tags
  ];

  List<Product> getFilteredProducts() {
    if (mySelectedChip == null) {
       notifyListeners();
      return allProducts;
    } else {
        notifyListeners();
      return allProducts
          .where((product) => product.tags.contains(mySelectedChip))
          .toList();
    }
  }

  String? get selectedChip => mySelectedChip;

  void selectChip(String? chip) {
    mySelectedChip = chip;
    notifyListeners();
  }
}
