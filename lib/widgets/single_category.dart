import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../routes/route_meal_list.dart';

class SingleCategory extends StatelessWidget {
  final String catId;
  final String title;
  final Color color;

  SingleCategory(this.catId, this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => _selectSingleItem(context, title, catId),
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: <Color>[
              color.withOpacity(0.7),
              color,
            ]),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _selectSingleItem(BuildContext ctx, String title, String catId) {
    Navigator.of(ctx).push(
      CupertinoPageRoute(builder: (_) {
        return MealList(title, catId);
      }),
    );
  }
}
