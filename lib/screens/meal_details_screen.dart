import 'package:flutter/material.dart';
import 'package:meals_app/utils/app_layout.dart';
import '../data/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routName = '/meal-detail';
  Widget titleSection(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: AppLayout.getHeight(12),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      height: AppLayout.getHeight(150),
      width: AppLayout.getWidth(300),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(
          AppLayout.getHeight(10),
        ),
      ),
      margin: EdgeInsets.all(AppLayout.getHeight(10)),
      padding: EdgeInsets.all(
        AppLayout.getHeight(10),
      ),
      child: child,
    );
  }

  const MealDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere(
      ((meal) => meal.id == mealId),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: AppLayout.getHeight(300),
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl!,
                fit: BoxFit.cover,
              ),
            ),
            titleSection(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: AppLayout.getHeight(10),
                      horizontal: AppLayout.getWidth(5),
                    ),
                    child: Text(selectedMeal.ingredients![index]),
                  ),
                ),
                itemCount: selectedMeal.ingredients!.length,
              ),
            ),
            titleSection(context, 'Steps'),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${index + 1}'),
                    ),
                    title: Text(selectedMeal.steps![index]),
                  ),
                  const Divider()
                ],
              ),
              itemCount: selectedMeal.steps!.length,
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(mealId);
        },
        child: Icon(Icons.delete),
      ),
    );
  }
}
