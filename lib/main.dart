import 'package:flutter/material.dart';
import './dummy-data.dart';
import './screen/category_meal_screen.dart';
import './screen/filters_screen.dart';
import './screen/meal_detail_screen.dart';
import './screen/tab_screen.dart';
import 'models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeal = DUMMY_MEALS;

  void saveFilters(Map<String, bool> _filterData) {
    setState(() {
      _filters = _filterData;

      // ignore: missing_return
      _availableMeal = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.teal,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              headline4: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 36,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
              headline5: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
              headline6: TextStyle(
                fontSize: 30,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.tealAccent),
      ),
      // home: TabScreen(),
      routes: {
        '/': (context) => TabScreen(),
        CategoryMealScreen.StringRoute: (context) =>
            CategoryMealScreen(_availableMeal),
        MealDetailScreen.StringRoute: (context) => MealDetailScreen(),
        Filters.StringRoute: (context) => Filters(_filters, saveFilters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  // ignore: missing_return
  Widget build(BuildContext context) {}
}
