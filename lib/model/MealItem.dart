import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'CartItem.dart';
import 'meal.dart';
import 'CartProvider.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  MealItem(this.meal);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return InkWell(
      onTap: () {},
      child: GridTile(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black45,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  meal.title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                icon: Icon(Icons.shopping_cart),
                color: Colors.white,
                onPressed: () {
                  cartProvider.addToCart(
                      CartItem(meal: meal, price: meal.price, quantity: 1));
                },
              ),
            ],
          ),
          subtitle: Text(
            '${meal.price} PKR',
            style: TextStyle(fontSize: 14),
          ),
        ),
      ),
    );
  }
}
