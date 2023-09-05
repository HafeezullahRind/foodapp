import 'package:flutter/material.dart';
import '../data/data.dart';
import '../model/cart.dart';
import '../model/meal.dart';
import '../routes/route_meal_detail.dart';

class MealList extends StatelessWidget {
  final String foodCategoryTitle;
  final String catId;
  final List<Cart> cartItems = [];
  MealList(this.foodCategoryTitle, this.catId);

  void _addToCart(Meal meal) {
    final cartItem = Cart(
      mealId: meal.id,
      mealName: meal.title,
      mealImageUrl: meal.imageUrl,
    );
    cartItems.add(cartItem);
    print(cartItem.mealId);
    print(cartItem.mealImageUrl);
    print(cartItem.mealName);
    // You can show a confirmation message to the user here if needed.
  }

  @override
  Widget build(BuildContext context) {
    final mealNameList =
        DUMMY_MEALS.where((each) => each.categories.contains(catId)).toList();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(foodCategoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return MealDetailRoute(mealNameList[index].id);
              }));
            },
            child: Column(children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(mealNameList[index].imageUrl),
                ),
                title: Text(mealNameList[index].title),
                subtitle:
                    Text(mealNameList[index].duration.toString() + " minutes"),
                trailing: IconButton(
                  icon: Icon(Icons.more_horiz),
                  onPressed: () {},
                ),
              ),
              Image.network(mealNameList[index].imageUrl),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        const Icon(Icons.access_time),
                        const SizedBox(width: 10),
                        Text(mealNameList[index].duration.toString() +
                            " minutes"),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const Icon(Icons.assignment),
                        const SizedBox(width: 10),
                        const Text("Tap on food for detail"),
                        const SizedBox(
                          width: 20,
                        ),
                        // IconButton(
                        //   onPressed: () {
                        //     _addToCart(mealNameList[index]);
                        //   },
                        //   icon: const Icon(Icons.add_shopping_cart),
                        // )
                      ],
                    )
                  ],
                ),
              ),
            ]),
          );
        },
        itemCount: mealNameList.length,
      ),
    );
  }
}
