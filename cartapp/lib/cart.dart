// cart.dart
import 'package:flutter/material.dart';
import 'product.dart';

class Cart extends ChangeNotifier {
  final List<Product> _products = [];

  List<Product> get products => _products;

  double get totalPrice {
    double sum = 0.0;
    _products.forEach((product) {
      sum += product.price;
    });
    return sum;
  }

  void addToCart(Product product) {
    _products.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _products.remove(product);
    notifyListeners();
  }
}
