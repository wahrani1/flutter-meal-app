import 'package:flutter/material.dart';
import 'drawer_screen.dart';

class Filters extends StatefulWidget {
  static const String StringRoute = 'filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  Filters(this.currentFilters, this.saveFilters);

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  initState() {
     _glutenFree = widget.currentFilters['gluten'];
     _lactoseFree = widget.currentFilters['lactose'];
     _vegan = widget.currentFilters['vegan'];
     _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  // ignore: non_constant_identifier_names
  buildSwitch_istTile(
      String title, String desc, bool val, Function whenSwitchChanged) {
    return SwitchListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline5,
        ),
        subtitle: Text(desc),
        value: val,
        onChanged: whenSwitchChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(
                Icons.done,
                size: 30,
              ),
              onPressed: () {
                final Map<String, bool> selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilters);
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitch_istTile(
                  'Gluten Free',
                  'Only include gluten-free meals.',
                  _glutenFree,
                  (value) {
                    setState(
                      () {
                        _glutenFree = value;
                      },
                    );
                  },
                ),
                buildSwitch_istTile(
                  'Lactose Free',
                  'Only include lactose-free meals.',
                  _lactoseFree,
                  (value) {
                    setState(
                      () {
                        _lactoseFree = value;
                      },
                    );
                  },
                ),
                buildSwitch_istTile(
                  'Vegetarian',
                  'Only include vegetarian meals',
                  _vegetarian,
                  (value) {
                    setState(
                      () {
                        _vegetarian = value;
                      },
                    );
                  },
                ),
                buildSwitch_istTile(
                  'Vegan',
                  'Only include vegan meals',
                  _vegan,
                  (value) {
                    setState(
                      () {
                        _vegan = value;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
