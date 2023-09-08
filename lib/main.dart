import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/Screens/SignUp.dart';
import 'package:provider/provider.dart';

import 'Screens/LoginPage.dart';
import 'model/CartProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
    return MaterialApp(
      routes: {
        '/signup': (context) => SignUpPage(),
        // ... other routes
      },
      debugShowCheckedModeBanner: false,
      title: "Food App",
      home: LoginPage(),
    );
  }
}
