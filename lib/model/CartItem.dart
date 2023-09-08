import 'meal.dart';

class CartItem {
  final Meal meal;
  final double price;

  var quantity;

  CartItem({
    required this.meal,
    required this.price,
    required int quantity,
  });
}
