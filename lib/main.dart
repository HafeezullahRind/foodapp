import 'package:flutter/material.dart';
import 'package:foodapp/Screens/MainPage.dart';
import 'package:foodapp/Screens/SignUp.dart';
import 'Screens/LoginPage.dart';
import 'package:foodapp/Screens/forgetpass.dart';

void main() {
  runApp(MyApp());
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
