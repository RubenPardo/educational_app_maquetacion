import 'package:educational_app_maquetacion/data/model/category.dart';
import 'package:educational_app_maquetacion/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;
  const CategoryWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: AppColors.cardColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            const SizedBox(height: 9,),
            Image.asset(category.assetPath),
            const SizedBox(height: 9,),
            Text(category.name)
          ],
        ),
      ),
    );
  }
}