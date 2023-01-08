import 'package:flutter/material.dart';
import '../utils/app_layout.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilter;
  final Map<String, bool> currentFilters;
  const FilterScreen(this.saveFilter, this.currentFilters, {super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegan = widget.currentFilters['vegan']!;
    _vegetarian= widget.currentFilters['vegetarian']!;
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    ValueChanged<bool> updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Filters!'),
          actions: [
            IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilter(selectedFilters);
              },
              icon: const Icon(Icons.save),
            ),
          ],
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(
                AppLayout.getHeight(20),
              ),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile(
                    'Gluten-free',
                    'Only include gluten-free meals',
                    _glutenFree,
                    (newValue) {
                      setState(
                        () {
                          _glutenFree = newValue;
                        },
                      );
                    },
                  ),
                  _buildSwitchListTile(
                    'Lactose-free',
                    'Only include Lactose-free meals',
                    _lactoseFree,
                    (newValue) {
                      setState(
                        () {
                          _lactoseFree = newValue;
                        },
                      );
                    },
                  ),
                  _buildSwitchListTile(
                    'Vegetarian',
                    'Only include Vegetarian meals',
                    _vegetarian,
                    (newValue) {
                      setState(
                        () {
                          _vegetarian = newValue;
                        },
                      );
                    },
                  ),
                  _buildSwitchListTile(
                    'Vegan',
                    'Only include Vegan meals',
                    _vegan,
                    (newValue) {
                      setState(
                        () {
                          _vegan = newValue;
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
