import 'package:educational_app_maquetacion/data/model/category.dart';
import 'package:educational_app_maquetacion/presentation/widgets/cateogry_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CategoriesWidget extends StatelessWidget {
  final List<Category> categories;
  const CategoriesWidget({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
            height: size.height*0.15,
            child: ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) => const SizedBox(width: 15),
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => CategoryWidget(category: categories[index]),
            ),
          );
  }
}