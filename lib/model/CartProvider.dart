import 'package:flutter/foundation.dart';

import 'CartItem.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addToCart(CartItem cartItem) {
    cartItem.quantity = 1;
    _cartItems.add(cartItem);
    notifyListeners();
  }

  void decreaseItemQuantity(CartItem cartItem) {
    final existingCartItem = _cartItems.firstWhere(
      (item) => item.meal.id == cartItem.meal.id,
      orElse: () => CartItem(
        meal: cartItem.meal,
        price: cartItem.price,
        quantity: 0, // Set the initial quantity to 0
      ),
    );

    if (existingCartItem.quantity > 1) {
      existingCartItem.quantity--;
    } else {
      _cartItems.remove(existingCartItem);
    }

    notifyListeners();
  }

  void increaseItemQuantity(CartItem cartItem) {
    final existingCartItem = _cartItems.firstWhere(
      (item) => item.meal.id == cartItem.meal.id,
      orElse: () => CartItem(
        meal: cartItem.meal,
        price: cartItem.price,
        quantity: 0, // Set the initial quantity to 0
      ),
    );

    existingCartItem.quantity++;

    notifyListeners();
  }
}
