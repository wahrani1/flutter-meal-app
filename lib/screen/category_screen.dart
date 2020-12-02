import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../widgets/categories_item.dart';
import '../dummy-data.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES
            .map(
              (index) => CategoriesItems(
                index.id,
                index.title,
                index.color,
              ),
            )
            .toList(),
      ),
    );
  }
}
