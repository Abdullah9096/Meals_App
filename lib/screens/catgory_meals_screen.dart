import '../models/meal.dart';

import '../dummy_data.dart';

import '../widgets/meal_item.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatefulWidget {
  final List<Meal> flitersMeals;
  CategoryMealsScreen(this.flitersMeals);
  //final String categId;
  // final String cateName;

  // CategoryMealsScreen(this.categId, this.cateName);
  static const routeCategoryScreen = '/categories_meal';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String cateName;
  List<Meal> categoriesMeal;
  bool _loadInitData = false;
  @override
  void didChangeDependencies() {
    print('didchange');
    if (_loadInitData == false) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      cateName = routeArgs['name'];
      final String categId = routeArgs['id'];
      categoriesMeal = widget.flitersMeals.where((meal) {
        return meal.categoriesID.contains(categId);
      }).toList();
      _loadInitData = true;
    }
    super.didChangeDependencies();
  }

  /*void _removeItem(String mealId) {
    setState(() {
      categoriesMeal.removeWhere((meal) => meal.id == mealId);
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cateName),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoriesMeal[index].id,
            name: categoriesMeal[index].name,
            imageUrl: categoriesMeal[index].imageUrl,
            duration: categoriesMeal[index].duration,
            complexity: categoriesMeal[index].complexity,
            affordability: categoriesMeal[index].affordability,
          );
        },
        itemCount: categoriesMeal.length,
      ),
    );
  }
}
