import 'package:flutter/material.dart';
import '../widgets/main-drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Map<String, bool?> currentFilters;
  final Function changeFilters;

  FilterScreen(this.currentFilters, this.changeFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    super.initState();
  }

  Widget buildSwitchListTile(
      String title, String sub, bool currentStatus, updateValue) {
    return SwitchListTile(
      value: currentStatus,
      activeColor: Theme.of(context).primaryColor,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(sub),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Favorites'),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                "gluten": _glutenFree,
                "lactose": _lactoseFree,
                "vegan": _vegan,
                "vegetarian": _vegetarian,
              };
              widget.changeFilters(selectedFilters);
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust your meal selection',
                style: Theme.of(context).textTheme.headline6),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile(
                  'Gluten-free', 'Only include gluten-free meals', _glutenFree,
                  (val) {
                setState(() {
                  _glutenFree = val;
                });
              }),
              buildSwitchListTile(
                  'Vegetarian', 'Only include vagetarian meals', _vegetarian,
                  (val) {
                setState(() {
                  _vegetarian = val;
                });
              }),
              buildSwitchListTile('Vegan', 'Only include vegan meals', _vegan,
                  (val) {
                setState(() {
                  _vegan = val;
                });
              }),
              buildSwitchListTile('Lactose-free',
                  'Only include lactose-free meals', _lactoseFree, (val) {
                setState(() {
                  _lactoseFree = val;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}
