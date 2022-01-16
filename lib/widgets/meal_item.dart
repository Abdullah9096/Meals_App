import '../screens/meal_detail_screen.dart';
import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String name;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    @required this.id,
    @required this.name,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });
  void selectItem(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetailScreen.routeMeal, arguments: id)
        .then((result) {
      if (result != null) {
        //..removeItem(result);
      }
    });
  }

  String get complex {
    String complex;
    switch (complexity) {
      case Complexity.Simple:
        complex = 'Simple';
        break;
      case Complexity.Challenging:
        complex = 'Challenging';
        break;
      case Complexity.Hard:
        complex = 'Hard';
        break;
      default:
        complex = 'Unknown';
    }
    return complex;
  }

  String get affordable {
    String afford;
    switch (affordability) {
      case Affordability.Affordable:
        afford = 'Affordable';
        break;
      case Affordability.Pricey:
        afford = 'Pricey';
        break;
      case Affordability.Luxurious:
        afford = 'Expensive';
        break;
      default:
        afford = 'Unknown';
    }
    return afford;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectItem(context),
      borderRadius: BorderRadius.circular(20),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 7,
        margin: EdgeInsets.all(8),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.network(
                    imageUrl,
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 320,
                    padding: EdgeInsets.symmetric(
                      vertical: 7,
                      horizontal: 25,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black54,
                    ),
                    child: Text(
                      name,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 3,
                      ),
                      Text('$duration min')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 3,
                      ),
                      Text(complex),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 3,
                      ),
                      Text(affordable),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
