import 'package:Meals1/models/meal.dart';
import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favouritesMel;
  FavouriteScreen(this.favouritesMel);
  @override
  Widget build(BuildContext context) {
    if (favouritesMel.isEmpty) {
      return Center(
        child: Text('you don\'t Favourites Categories yet'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favouritesMel[index].id,
            name: favouritesMel[index].name,
            imageUrl: favouritesMel[index].imageUrl,
            duration: favouritesMel[index].duration,
            complexity: favouritesMel[index].complexity,
            affordability: favouritesMel[index].affordability,
          );
        },
        itemCount: favouritesMel.length,
      );
    }
  }
}
