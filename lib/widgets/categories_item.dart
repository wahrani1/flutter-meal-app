import 'package:flutter/material.dart';
import '../screen/category_meal_screen.dart';

class CategoriesItems extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoriesItems(
    this.id,
    this.title,
    this.color,
  );

  // ignore: non_constant_identifier_names
  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      CategoryMealScreen.StringRoute,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      borderRadius: BorderRadius.circular(15),
      splashColor: Colors.teal,
      child: Container(
        padding: EdgeInsets.all(8),
        child: Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              color.withOpacity(.5),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}
