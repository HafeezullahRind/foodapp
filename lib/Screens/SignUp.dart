import 'package:flutter/material.dart';
import 'package:foodapp/Screens/LoginPage.dart';
import '../Components/CustomTextField.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  var rememberPassword = false;

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
                      ),
                      CustomTextField(
                        label: "Email",
                        controller: _emailController,
                        icon: Icon(Icons.email_outlined),
                        onChanged: (newValue) {
                          print('User input: $newValue');
                        },
                        obscureText: false,
                      ),
                      CustomTextField(
                        label: "Password",
                        controller: _passwordController,
                        icon: Icon(Icons.lock_outlined),
                        onChanged: (newValue) {
                          print('User input: $newValue');
                        },
                        obscureText: true,
                      ),
                      CustomTextField(
                        label: "Confirm Password",
                        controller: _confirmPasswordController,
                        icon: Icon(Icons.lock_outlined),
                        onChanged: (newValue) {
                          print('User input: $newValue');
                        },
                        obscureText: true,
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
                            // if (_formKey.currentState!.validate()) {
                            //   print('Sign up successful');
                            // }
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
}
