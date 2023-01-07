import 'package:flutter/material.dart';
import 'package:meals_app/utils/app_layout.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  const CategoryItem(this.title, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: AppLayout.getWidth(15),
        horizontal: AppLayout.getHeight(15),
      ),
      child: Text(title),

    );
  }
}
