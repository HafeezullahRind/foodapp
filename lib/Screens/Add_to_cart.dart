import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../model/CartProvider.dart';
import 'location.dart'; // Import your LocationScreen

class CartPage extends StatelessWidget {
   Map<String, dynamic>? paymentIntent; 
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    double totalSum = cartProvider.cartItems
        .map((cartItem) => cartItem.price * cartItem.quantity)
        .fold(0, (prev, price) => prev + price);

    Map<String, dynamic>? paymentIntent;

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
              Text(
                "Total : ${totalSum.toStringAsFixed(2)} PKR",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () async {
                  await makePayment(context); // Pass the context
                },
                child: Text('Complete Order'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> makePayment(BuildContext context) async {
    try {
      paymentIntent = await createPaymentIntent('360', 'pkr');
      // Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent!['client_secret'],
          style: ThemeMode.dark,
          merchantDisplayName: 'Hafeez',
        ),
      )
          .then((value) {});

      /// Now finally display payment sheet
      displayPaymentSheet(context); // Pass the context
    } catch (e, s) {
      print('exception:$e$s');
    }
  }

  displayPaymentSheet(BuildContext context) async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        showDialog(
          context: context,
          builder: (_) => const AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),
                    Text("Payment Successful"),
                  ],
                ),
              ],
            ),
          ),
        );
         
        paymentIntent = null;
      }).onError((error, stackTrace) {
        print('Error is:--->$error $stackTrace');
      });
    } on StripeException catch (e) {
      print('Error is:---> $e');
      showDialog(
        context: context,
        builder: (_) => const AlertDialog(
          content: Text("Cancelled "),
        ),
      );
    } catch (e) {
      print('$e');
    }
  }

  // Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization':
              'Bearer sk_test_51NlxD4GOW0sElC9eoY43L59uuqPhA9pjzJQyntcH95TjL9jg0fJXK5cKbtHY7PgotodejuWszglafDXu00p8i1Ad00lQb66qFD',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      // ignore: avoid_print
      print('Payment Intent Body->>> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      // ignore: avoid_print
      print('err charging user: ${err.toString()}');
    }
  }

  String calculateAmount(String amount) {
    final calculatedAmout = (int.parse(amount)) * 100;
    return calculatedAmout.toString();
  }
}
