import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteList;
  const FavoriteScreen(this.favoriteList, {super.key});

  @override
  Widget build(BuildContext context) {
    if (favoriteList.isEmpty) {
      return const Center(
        child: Text('You have no favorite yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteList[index].id!,
            title: favoriteList[index].title!,
            imageUrl: favoriteList[index].imageUrl!,
            duration: favoriteList[index].duration!,
            complexity: favoriteList[index].complexity!,
            affordability: favoriteList[index].affordability!,
          );
        },
        itemCount: favoriteList.length,
      );
    }
  }
}
