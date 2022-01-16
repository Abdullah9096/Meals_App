import '../widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersSreen extends StatefulWidget {
  static const routename = '/Filters';
  final Function saveFilter;
  final Map<String, bool> currentFilters;
  FiltersSreen(this.currentFilters, this.saveFilter);

  @override
  _FiltersSreenState createState() => _FiltersSreenState();
}

class _FiltersSreenState extends State<FiltersSreen> {
  var gluttenFree = false;
  var lactosFree = false;
  var _vegeterian = false;
  var _vegan = false;

  @override
  initState() {
    gluttenFree = widget.currentFilters['gluten'];
    lactosFree = widget.currentFilters['lactos'];
    _vegeterian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];

    super.initState();
  }

  Widget _buildSwitchListTile(String title, String describtion,
      bool currentValue, Function changeValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(describtion),
      value: currentValue,
      onChanged: changeValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: [
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  final selectedfilters = {
                    'gluten': gluttenFree,
                    'lactos': lactosFree,
                    'vegetarian': _vegeterian,
                    'vegan': _vegan,
                  };
                  widget.saveFilter(selectedfilters);
                })
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              child: Text('Your meal selection'),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile(
                    'Gluteen_Free',
                    'just gluteen_free meals',
                    gluttenFree,
                    (newVlaue) {
                      setState(() {
                        gluttenFree = newVlaue;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    'Lactos_Free',
                    'just Lactos_free meals',
                    lactosFree,
                    (newVlaue) {
                      setState(() {
                        lactosFree = newVlaue;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    'vegetarian',
                    'just vegetarian meals',
                    _vegeterian,
                    (newVlaue) {
                      setState(() {
                        _vegeterian = newVlaue;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    'Vegan',
                    'just vegan meals',
                    _vegan,
                    (newVlaue) {
                      setState(() {
                        _vegan = newVlaue;
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
