import 'package:flutter/material.dart';

import './dummy_data.dart';
import './models/meal.dart';
import './screens/Filterscreen.dart';
import './screens/tabs_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/catgory_meals_screen.dart';
import 'screens/categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactos': false,
    'vegetarian': false,
    'vegan': false,
  };
  List<Meal> _filtersMeal = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  void _setFilters(Map<String, bool> nwFilters) {
    setState(() {
      _filters = nwFilters;
      _filtersMeal = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactos'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavourite(String mealId) {
    final index = _favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if (index >= 0) {
      setState(() {
        _favouriteMeals.removeAt(index);
      });
    } else {
      setState(() {
        _favouriteMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isFavourite(String id) {
    return _favouriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 255, 255, 2),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 55, 55, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 55, 55, 1),
              ),
              headline1: TextStyle(
                color: Colors.black,
                fontFamily: 'RobotoCondensed',
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      //  home: CategoryScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(_favouriteMeals),
        CategoryMealsScreen.routeCategoryScreen: (ctx) =>
            CategoryMealsScreen(_filtersMeal),
        MealDetailScreen.routeMeal: (ctx) =>
            MealDetailScreen(_toggleFavourite, _isFavourite),
        FiltersSreen.routename: (ctx) => FiltersSreen(_filters, _setFilters),
      },
      onGenerateRoute: (setting) {
        return MaterialPageRoute(
          builder: (ctx) {
            return CategoryScreen();
          },
        );
      },
      onUnknownRoute: (setting) {
        return MaterialPageRoute(
          builder: (ctx) {
            return CategoryScreen();
          },
        );
      },
    );
  }
}
