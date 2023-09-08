class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final int duration;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  final double price; 

  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.price, 
  });

  String get mealId => id;
  String get mealTitle => title;
}
