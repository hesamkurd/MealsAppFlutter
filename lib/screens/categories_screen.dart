import 'package:flutter/material.dart';
import '../utils/app_layout.dart';
import '../data/dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(AppLayout.getHeight(25)),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: AppLayout.getWidth(200),
        childAspectRatio: 3 / 2,
        crossAxisSpacing: AppLayout.getWidth(20),
        mainAxisSpacing: AppLayout.getHeight(20),
      ),
      children: DUMMY_CATEGORIES
          .map(
            (catData) => CategoryItem(catData.id, catData.title, catData.color),
          )
          .toList(),
    );
  }
}
