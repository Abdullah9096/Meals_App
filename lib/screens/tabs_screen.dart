import '../models/meal.dart';
import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import '../screens/categories_screen.dart';
import '../screens/favourite_sreen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;
  TabsScreen(this.favouriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  initState() {
    _pages = [
      {'page': CategoryScreen(), 'title': 'Categories'},
      {
        'page': FavouriteScreen(widget.favouriteMeals),
        'title': 'Your Favouriets'
      },
    ];
    super.initState();
  }

  int _pageIndex = 0;
  void _selectTab(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_pageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_pageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _pageIndex,
        //type: BottomNavigationBarType.shifting,
        onTap: _selectTab,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('Favouriets'),
          ),
        ],
      ),
    );
  }
}
