import 'package:flutter/material.dart';
import 'package:foodapp/Screens/Add_to_cart.dart';
import '../model/meal.dart';
import '../widgets/single_category.dart';
import '../data/data.dart';
import 'Profile.dart';
import '../model/cart.dart';
import 'location.dart';

final List<Cart> cartItems = [];
late final String foodCategoryTitle;
late final String catId;

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Cart> cartItems = [];
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 4 / 3,
              shrinkWrap: true,
              children: DUMMY_CATEGORIES
                  .map(
                      (item) => SingleCategory(item.id, item.title, item.color))
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
                MaterialPageRoute(
                    builder: (context) => AddToCartScreen(cartItems)),
              );
            }
            if (index == 1) {
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
                onSubmitted: (value) {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _topWidget() {
  return LayoutBuilder(
    builder: (BuildContext context, BoxConstraints constraints) {
      var screenWidth = MediaQuery.of(context).size.width;
      var screenHeight = MediaQuery.of(context).size.height;
      return SizedBox(
        height: 70,
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
  );
}
