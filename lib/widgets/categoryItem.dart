import '../screens/catgory_meals_screen.dart';
import 'package:flutter/material.dart';
//import './catgory_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String name;
  final Color bgcolor;
  CategoryItem(this.id, this.name, this.bgcolor);
  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeCategoryScreen,
        arguments: {'id': id, 'name': name});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Text(name, style: Theme.of(context).textTheme.headline1),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              bgcolor.withOpacity(0.7),
              bgcolor,
            ],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
