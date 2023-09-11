import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:foodapp/Screens/LoginPage.dart';
import 'package:foodapp/Screens/SignUp.dart';
import 'package:provider/provider.dart';

import 'model/CartItem.dart';
import 'model/CartProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      'pk_test_51NlxD4GOW0sElC9eNcFip24B2UxcELTU0ymmAktKkqEqIVAKX5Iwq8CNSprqfLJe2kGs01Q4iEXSGsTFzlaMsFSS00ukyqYpAh';
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCjalp654WdInDaWdh1zAeclPDz2zi9NZw",
      projectId: "YOUR_PROJECT_ID",
      appId: "1:12354974215:android:f7e654cfa5a3e2203670a2",
      messagingSenderId: '',
    ),
  );
  runApp(ChangeNotifierProvider(
      create: (context) => CartProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<CartItem> cartItems = [];
    return MaterialApp(routes: {
      '/signup': (context) => SignUpPage(),
      // ... other routes
    }, debugShowCheckedModeBanner: false, title: "Food App", home: LoginPage()
        //MainPage(cartItems: cartItems),
        );
  }
}
