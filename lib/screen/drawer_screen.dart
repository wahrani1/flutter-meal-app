import 'package:flutter/material.dart';
import 'filters_screen.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColor,
            height: 120,
            width: double.infinity,
            child: Text(
              'Cooking UP!',
              style: TextStyle(
                fontSize: 30,
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          // ignore: missing_return
          BuildListTile(context, 'Meal', Icons.restaurant, () {
            // ignore: missing_return, missing_return
            Navigator.of(context).pushReplacementNamed('/');
          }),
          // ignore: missing_return
          BuildListTile(context, 'Filter', Icons.settings, () {
            Navigator.pop(context);
            Navigator.of(context).pushReplacementNamed(Filters.StringRoute);
          }),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  BuildListTile(context, String text, IconData icon, Function selectedItem()) {
    return ListTile(
      onTap: selectedItem,
      leading: Icon(
        icon,
        size: 26,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          fontFamily: 'RobotoCondensed',
        ),
      ),
    );
  }
}
