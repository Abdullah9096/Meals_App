import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  final Function toogleFavourite;
  final Function isFavourite;
  MealDetailScreen(this.toogleFavourite, this.isFavourite);
  static const routeMeal = '/meal_detail';
  Widget buildTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

  Widget buildContainer({Widget child}) {
    return Container(
      child: child,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)),
      height: 170,
      width: 340,
    );
  }

  @override
  Widget build(BuildContext context) {
    String mealDet = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealDet);

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.name}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              margin: EdgeInsets.all(5),
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            buildTitle(context, 'Ingredients'),
            buildContainer(
              child: ListView.builder(
                itemBuilder: (ctx, index) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Card(
                    color: Colors.cyan,
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 9),
                        child: Text(selectedMeal.ingredients[index])),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildTitle(context, 'Steps'),
            buildContainer(
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('#${index + 1}'),
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      Divider(),
                    ],
                  );

                  /*Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Card(
                      color: Colors.amber,
                      child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 9),
                          child: Text(selectedMeal.steps[index])),
                    ),
                  );*/
                },
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        splashColor: Theme.of(context).accentColor,
        child: Icon(
          isFavourite(mealDet) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => toogleFavourite(mealDet),
      ),
    );
  }
}
