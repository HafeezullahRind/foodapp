import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/Screens/LoginPage.dart';
import '../model/CustomTextField.dart';
import '../model/toastMessage.dart';
import 'MainPage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  var rememberPassword = false;
  final _formkey = GlobalKey<FormState>();
  bool loading = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 0.45 * screenWidth,
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
                  Image.asset(
                    'images/CreateAcc.png',
                    height: 0.45 * screenWidth,
                    width: 0.55 * screenWidth,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 0.25 * screenWidth,
                right: 0.5 * screenWidth,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sign up ",
                    style: TextStyle(
                      color: Color(0xFF0d65fb),
                      fontWeight: FontWeight.bold,
                      fontSize: 0.06 * screenWidth,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.all(0.05 * screenWidth),
                  color: Colors.white,
                  padding: EdgeInsets.all(0.04 * screenWidth),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        CustomTextField(
                          label: "Username",
                          controller: _usernameController,
                          icon: Icon(Icons.person_2_outlined),
                          onChanged: (newValue) {
                            print('User input: $newValue');
                          },
                          obscureText: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Username";
                            }
                            return null;
                          },
                        ),
                        CustomTextField(
                          label: "Email",
                          controller: _emailController,
                          icon: Icon(Icons.email_outlined),
                          onChanged: (newValue) {
                            print('User input: $newValue');
                          },
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
                          controller: _passwordController,
                          icon: Icon(Icons.lock_outlined),
                          onChanged: (newValue) {
                            print('User input: $newValue');
                          },
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Password";
                            }
                            return null;
                          },
                        ),
                        CustomTextField(
                          label: "Confirm Password",
                          controller: _confirmPasswordController,
                          icon: Icon(Icons.lock_outlined),
                          onChanged: (newValue) {
                            print('User input: $newValue');
                          },
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Confirm Password";
                            }
                            return null;
                          },
                        ),
                        Container(
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
                              Text('Remember Password',
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.030,
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          height: 0.08 * screenWidth,
                          width: 0.7 * screenWidth,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextButton(
                            onPressed: () {
                              Signup();
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.032),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text.rich(
                    TextSpan(
                      text: 'Already have an account? ',
                      children: [
                        TextSpan(
                          text: 'Sign In',
                          style: TextStyle(
                            fontSize: screenWidth * 0.032,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void Signup() {
    if (_formkey.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      _auth
          .createUserWithEmailAndPassword(
              email: _emailController.text.toString(),
              password: _passwordController.text.toString())
          .then((value) => setState(() {
                loading = false;
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainPage(),
                  ),
                );
              }))
          .onError(
        (error, stackTrace) {
          setState(() {
            loading = false;
          });
          toast().toastMessage(
            error.toString(),
          );
        },
      );
    }
  }
}
