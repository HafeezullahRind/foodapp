import 'package:flutter/material.dart';
import '../model/CustomTextField.dart';

class ForgetPass extends StatelessWidget {
  ForgetPass({Key? key});

  TextEditingController EmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Navigate back to the previous screen
              Navigator.pop(context);
            },
          ),
          backgroundColor: Color(0xFF0d65fb),
          title: Text(
            'Forgot Password',
            style: TextStyle(
              fontSize: screenHeight * 0.025,
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 0.6 * screenWidth, // Adjust this value
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
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
                    "images/2.png",
                    height: 0.5 * screenWidth, // Adjust this value
                    width: 0.75 * screenWidth, // Adjust this value
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 0.17 * screenWidth,
                right: 0.4 * screenWidth,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Forget ",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 0.06 * screenWidth, // Adjust this value
                    ),
                  ),
                  Text(
                    "Password ?",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 0.06 * screenWidth, // Adjust this value
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(0.08 * screenWidth), // Adjust this value
              padding: EdgeInsets.all(0.05 * screenWidth), // Adjust this value
              child: CustomTextField(
                label: "Email",
                controller: EmailController,
                icon: Icon(Icons.email_outlined),
                onChanged: (newValue) {
                  // Handle user input here
                  print('User input: $newValue');
                },
                obscureText: false,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  bottom: 0.2 * screenWidth), // Adjust this value
              height: 0.1 * screenWidth, // Adjust this value
              width: 0.7 * screenWidth, // Adjust this value
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                onPressed: () {
                  // Handle login button tap
                },
                child: Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 0.04 * screenWidth, // Adjust this value
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
