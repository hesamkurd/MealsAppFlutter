import 'package:flutter/material.dart';
import 'package:meals_app/utils/app_layout.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  const CategoryItem(this.title, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppLayout.getWidth(15)),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withOpacity(0.7),
            color,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(
          AppLayout.getWidth(15),
        ),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
