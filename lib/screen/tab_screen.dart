import 'package:flutter/material.dart';
import 'drawer_screen.dart';
import 'category_screen.dart';
import 'favorites_screen.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Map<String, Object>> _pages = [
    {
      'page': CategoryScreen(),
      'title': 'Categoies',
    },
    {
      'page': FavoritesScreen(),
      'title': 'Favorites',
    }
  ];
  int _selectedItemIndex = 0;

  void _selectItem(int value) {
    setState(() {
      _selectedItemIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedItemIndex]['title']),
      ),
      body: _pages[_selectedItemIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        showSelectedLabels: false,
        selectedIconTheme: IconThemeData(
          size: 40,
        ),
        unselectedLabelStyle: TextStyle(color: Theme.of(context).accentColor),
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedItemIndex,
        type: BottomNavigationBarType.shifting,
        onTap: _selectItem,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.category,
            ),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.favorite,
            ),
            label: 'Favorites',
          ),
        ],
      ),
      drawer: MyDrawer(),
    );
  }
}
