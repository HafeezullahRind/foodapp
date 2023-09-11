import 'package:flutter/material.dart';
import 'package:foodapp/Screens/location.dart';

import '../model/CartItem.dart';
import 'LoginPage.dart';
import 'MainPage.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  List<CartItem> cartItems = [];

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Profile ',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.036),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.white,
        ),
        body: ListView(
          children: [
            Container(
              height: 100,
            ),
            ListTile(
              leading: Icon(Icons.person_2_rounded),
              title: Text('Login',
                  style: TextStyle(fontSize: screenWidth * 0.036)),
              onTap: () {
                // Navigate to login page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                'General Settings',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: screenWidth * 0.036),
              ),
              onTap: () {
                // Navigate to settings page
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About',
                  style: TextStyle(fontSize: screenWidth * 0.036)),
              onTap: () {
                // Show app information
              },
            ),
            ListTile(
              leading: Icon(Icons.description),
              title: Text('Terms & Conditions',
                  style: TextStyle(fontSize: screenWidth * 0.036)),
              onTap: () {
                // Show terms and conditions
              },
            ),
            ListTile(
              leading: Icon(Icons.privacy_tip),
              title: Text(
                'Privacy Policy',
                style: TextStyle(fontSize: screenWidth * 0.036),
              ),
              onTap: () {
                // Show privacy policy
              },
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Rate This App',
                  style: TextStyle(fontSize: screenWidth * 0.036)),
              onTap: () {
                // Open app store to rate the app
              },
            ),
          ],
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              unselectedItemColor: Colors.white,
              backgroundColor: Colors.blue,
              selectedItemColor: Colors.white.withOpacity(0.8),
              showSelectedLabels: true,
              showUnselectedLabels: true,
            ),
          ),
          child: BottomNavigationBar(
            currentIndex: 2,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.location_city_outlined),
                label: 'Location',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            onTap: (index) {
              if (index == 0) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MainPage(cartItems: cartItems)));
              }
              if (index == 1) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LocationScreen()));
              }
              // Switch between tabs
            },
          ),
        ));
  }
}
