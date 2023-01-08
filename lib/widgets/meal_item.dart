import 'package:flutter/material.dart';
import '../screens/meal_details_screen.dart';
import '../models/meal.dart';
import '../utils/app_layout.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  const MealItem(
      {super.key,
      required this.id,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.complexity,
      required this.affordability,
      });

  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return 'simple';
      case Complexity.hard:
        return 'hard';
      case Complexity.challenging:
        return 'challenging';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.affordable:
        return 'affordable';
      case Affordability.luxurious:
        return 'luxurious';
      case Affordability.pricey:
        return 'pricey';
      default:
        return 'Unknown';
    }
  }

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(
      MealDetailsScreen.routName,
      arguments: id,
    )
        .then((result) {
      if (result != null) {
        //removeItem(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppLayout.getHeight(15),
          ),
        ),
        elevation: 4,
        margin: EdgeInsets.all(
          AppLayout.getHeight(10),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      AppLayout.getHeight(15),
                    ),
                    topRight: Radius.circular(
                      AppLayout.getHeight(15),
                    ),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: AppLayout.getHeight(250),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: AppLayout.getHeight(20),
                  right: AppLayout.getWidth(10),
                  child: Container(
                    width: AppLayout.getWidth(300),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        AppLayout.getHeight(5),
                      ),
                      color: Colors.black54,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: AppLayout.getHeight(5),
                      horizontal: AppLayout.getWidth(20),
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: AppLayout.getHeight(26),
                          color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(
                AppLayout.getHeight(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      SizedBox(width: AppLayout.getWidth(6)),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      SizedBox(width: AppLayout.getWidth(6)),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money),
                      SizedBox(width: AppLayout.getWidth(6)),
                      Text(affordabilityText),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
