import 'package:flutter/material.dart';
import '../data/data.dart';
import '../model/meal.dart';
import '../model/cart.dart';

class AddToCartScreen extends StatelessWidget {
  final List<Cart> cartItems;

  AddToCartScreen(this.cartItems);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add to Cart'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final cartItem = cartItems[index];
          final meal =
              DUMMY_MEALS.firstWhere((item) => item.id == cartItem.mealId);

          return Card(
            elevation: 3,
            child: Column(
              children: [
                Image.network(
                  meal.imageUrl,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 8),
                Text(
                  meal.title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
