import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  final Map<String, int> _items = {};
  final Map<String, Product> _catalog;

  CartProvider(this._catalog);

  Map<String, int> get items => {..._items};

  int qtyOf(String id) => _items[id] ?? 0;

  void addOne(String id) {
    _items[id] = (_items[id] ?? 0) + 1;
    notifyListeners();
  }

  int get total {
    int total = 0;
    _items.forEach((id, qty) {
      total += _catalog[id]!.price * qty;
    });
    return total;
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
