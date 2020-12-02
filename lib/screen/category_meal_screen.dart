import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  static const String StringRoute = 'category_meals';

  final List<Meal> _availableMeal;

  CategoryMealScreen(this._availableMeal);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final catID = routeArg['id'];
    final catTitle = routeArg['title'];
    final dummyMeal = widget._availableMeal.where((meal) {
      return meal.categories.contains(catID);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle),
      ),
      body: ListView.builder(
        // ignore: missing_return
        itemBuilder: (context, index) {
          return MealItems(
            id: dummyMeal[index].id,
            title: dummyMeal[index].title,
            imageUrl: dummyMeal[index].imageUrl,
            affordability: dummyMeal[index].affordability,
            complexity: dummyMeal[index].complexity,
            duration: dummyMeal[index].duration,
          );
        },
        itemCount: dummyMeal.length,
      ),
    );
  }
}
