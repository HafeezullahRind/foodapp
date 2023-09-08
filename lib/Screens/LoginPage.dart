import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../model/CustomTextField.dart';
import 'package:foodapp/Screens/forgetpass.dart';

import 'MainPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var rememberPassword = false;
  final _formkey = GlobalKey<FormState>();
  bool loading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 0.6 * screenWidth, // Adjust this value
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Hallal Foods",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20, // Adjust this value
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Image.asset(
                    "images/login.png",
                    height: 0.25 * screenWidth, // Adjust this value
                    width: 0.3 * screenWidth, // Adjust this value
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(0.06 * screenWidth),
              color: Colors.white,
              padding: EdgeInsets.only(
                top: 0.25 * screenWidth,
              ),
              // Adjust this value
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: nameController,
                          icon: Icon(Icons.email_outlined),
                          onChanged: (newValue) {
                            print('User input: $newValue');
                          },
                          label: 'Email',
                          obscureText: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Email";
                            }
                            return null;
                          },
                        ),
                        CustomTextField(
                          label: "Password",
                          controller: passwordController,
                          icon: Icon(Icons.lock_outline),
                          onChanged: (newValue) {
                            print('User input: $newValue');
                          },
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Email";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 0.03 * screenWidth),
                        child: Row(
                          children: [
                            Checkbox(
                              value: rememberPassword,
                              onChanged: (value) {
                                setState(() {
                                  rememberPassword = value!;
                                });
                              },
                            ),
                            TextButton(
                              onPressed: () {
                                // Handle "Remember Password" button tap
                              },
                              child: Text(
                                'Remember Password',
                                style: TextStyle(fontSize: screenWidth * 0.032),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgetPass(),
                              ),
                            );
                            // Handle "Forgot Password" button tap
                          },
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(fontSize: screenWidth * 0.032),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 40,
                    width: 0.8 * screenWidth,
                    margin: EdgeInsets.only(top: 0.02 * screenWidth),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextButton(
                      onPressed: () {
                        login();
                      },
                      child: loading
                          ? const CircularProgressIndicator(
                              strokeWidth: 3,
                              color: Colors.white,
                            )
                          : Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 0.032 * screenWidth),
                            ),
                    ),
                  ),
                  SizedBox(height: 0.02 * screenWidth),
                  TextButton(
                    onPressed: () {
                      // Navigate to the signup page
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: Text(
                      "Don't have an Account? SignUp",
                      style: TextStyle(
                        fontSize: screenWidth * 0.032, // Adjust this value
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void login() {
    if (_formkey.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      _auth
          .signInWithEmailAndPassword(
              email: nameController.text.toString(),
              password: passwordController.text.toString())
          .then((value) {
        setState(() {
          loading = true;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Login Successfull'),
            ),
          );
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainPage(cartItems: []),
          ),
        );
      }).onError(
        (error, stackTrace) {
          setState(() {
            loading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Something went wrong try again'),
            ),
          );
        },
      );
    }
  }
}
