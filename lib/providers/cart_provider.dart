import 'package:flutter/foundation.dart';

class CartItemModel {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItemModel({
    this.id,
    this.title,
    this.quantity,
    this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItemModel> _items = {};
  Map<String, CartItemModel> get items {
    return {..._items};
  }

  int get itemNumber {
    return _items.length;
  }

  double get totalAmout {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(
    String productId,
    double price,
    String title,
  ) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (i) => CartItemModel(
          id: i.id,
          price: i.price,
          title: i.title,
          quantity: i.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItemModel(
            id: DateTime.now().toString(),
            title: title,
            price: price,
            quantity: 1),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }
}
