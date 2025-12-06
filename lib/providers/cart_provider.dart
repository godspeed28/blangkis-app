import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  final Map<String, int> _items = {}; // Map<productId, quantity>

  // Hapus constructor yang menerima dummyProducts

  Map<String, int> get items => Map.unmodifiable(_items);

  int get total {
    int sum = 0;
    // Perhitungan total akan dilakukan di tempat lain dengan mengakses product price
    return sum;
  }

  int get itemCount => _items.values.fold(0, (sum, qty) => sum + qty);

  int qtyOf(String productId) => _items[productId] ?? 0;

  void addOne(String productId) {
    _items.update(productId, (value) => value + 1, ifAbsent: () => 1);
    notifyListeners();
  }

  void removeOne(String productId) {
    if (_items.containsKey(productId)) {
      if (_items[productId]! > 1) {
        _items.update(productId, (value) => value - 1);
      } else {
        _items.remove(productId);
      }
      notifyListeners();
    }
  }

  void removeAll(String productId) {
    if (_items.containsKey(productId)) {
      _items.remove(productId);
      notifyListeners();
    }
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  // Method untuk menghitung total dengan data produk
  int calculateTotal(List<Product> products) {
    int total = 0;
    _items.forEach((productId, quantity) {
      final product = products.firstWhere(
        (p) => p.id == productId,
        orElse: () => Product(
          id: '',
          name: '',
          description: '',
          price: 0,
          assetImage: '',
        ),
      );
      total += product.price * quantity;
    });
    return total;
  }
}
