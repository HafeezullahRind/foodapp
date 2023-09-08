import 'package:flutter/material.dart';
import 'package:foodapp/Screens/PaymentScreen.dart';
import 'package:provider/provider.dart';
import '../model/CartProvider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    double totalSum = cartProvider.cartItems
        .map((cartItem) => cartItem.price * cartItem.quantity)
        .fold(0, (prev, price) => prev + price);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cartProvider.cartItems.length,
        itemBuilder: (context, index) {
          final cartItem = cartProvider.cartItems[index];

          // Increase item quantity logic
          void increaseQuantity() {
            cartProvider.increaseItemQuantity(cartItem);
          }

          // Decrease item quantity logic
          void decreaseQuantity() {
            cartProvider.decreaseItemQuantity(cartItem);
          }

          return ListTile(
            leading: Image.network(
              cartItem.meal.imageUrl, // Use the image URL from your CartItem
              width: 80, // Set the desired width
              height: 80, // Set the desired height
              fit: BoxFit.cover, // Adjust the fit as needed
            ),
            title: Text(cartItem.meal.title),
            subtitle: Text(
              'Price: ${cartItem.price.toStringAsFixed(2)} PKR',
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    // Check if quantity is greater than 1 before decreasing
                    if (cartItem.quantity > 1) {
                      decreaseQuantity();
                    }
                  },
                ),
                Text(
                  cartItem.quantity.toString(),
                  style: TextStyle(fontSize: 18),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    increaseQuantity();
                  },
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
          child: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total : ${totalSum.toStringAsFixed(2)} PKR",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Payment()),
                // );
              },
              child: Text('Complete Order'),
            ),
          ],
        ),
      )),
    );
  }
}
