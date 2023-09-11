import 'package:flutter/material.dart';
import 'package:foodapp/Screens/Add_to_cart.dart';
import 'package:provider/provider.dart';

import '../data/data.dart';
import '../model/CartItem.dart';
import '../model/CartProvider.dart';
import '../model/MealItem.dart';
import '../model/meal.dart';
import 'Profile.dart';
import 'location.dart';

class MainPage extends StatefulWidget {
  final List<CartItem> cartItems;

  MainPage({Key? key, required this.cartItems}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();

  void addToCart(Meal meal) {
    double price = meal.price;
    CartItem cartItem = CartItem(meal: meal, price: price, quantity: 1);
    cartItems.add(cartItem);
    print(cartItem.meal.imageUrl);
    print(cartItem.meal.mealTitle);
  }
}

class _MainPageState extends State<MainPage> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            onSearch: (query) {
              setState(() {
                searchQuery = query;
              });
            },
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2, // Number of columns in the grid
              mainAxisSpacing: 16.0, // Vertical spacing between grid items
              crossAxisSpacing: 16.0, // Horizontal spacing between grid items
              padding: const EdgeInsets.all(16.0), // Padding around the grid
              children: DUMMY_MEALS
                  .where((meal) => meal.title
                      .toLowerCase()
                      .contains(searchQuery.toLowerCase()))
                  .map((meal) => MealItem(meal))
                  .toList(),
            ),
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
          currentIndex: 1,
          onTap: (index) {
            if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            }

            if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            }
            if (index == 0) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LocationScreen()));
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ValueChanged<String> onSearch;

  CustomAppBar({required this.onSearch});

  @override
  Size get preferredSize => Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20)), // Set the border radius
      ),
      height: 140,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _topWidget(),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
              ),
              child: TextField(
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search Food Items',
                ),
                onChanged: onSearch,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _topWidget() {
  return SafeArea(
    child: LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var screenWidth = MediaQuery.of(context).size.width;
        var screenheight = MediaQuery.of(context).size.height;
        return SizedBox(
          height: 0.14 * screenWidth,
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://www.mensjournal.com/.image/c_limit%2Ccs_srgb%2Cq_auto:good%2Cw_760/MTk2MTM2NTcwNDMxMjg0NzQx/man-taking-selfie.webp'),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(
                        color: Colors.white, fontSize: screenWidth * 0.032),
                  ),
                  Text(
                    'User!',
                    style: TextStyle(
                        color: Colors.white, fontSize: screenWidth * 0.035),
                  ),
                ],
              ),
              Spacer(),
              IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
                onPressed: () {
                  // Notification logic
                },
              ),
            ],
          ),
        );
      },
    ),
  );
}
