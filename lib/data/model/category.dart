import 'dart:ui';

import 'package:educational_app_maquetacion/shared/colors.dart';

class Category{
  String name;
  String assetPath;
  Color backgroundColor;
  Color secondaryColor;
  Category(this.name,this.assetPath, this.backgroundColor,this.secondaryColor);


  factory Category.math(){
    return Category('Math', 'assets/images/math_logo.png',AppColors.mathBC, AppColors.mathSC);
  }

  factory Category.sicence(){
    return Category('Science', 'assets/images/science_logo.png',AppColors.scienceBC, AppColors.scienceBC);
  }

  factory Category.grammar(){
    return Category('Grammar', 'assets/images/grammar_logo.png',AppColors.gramBC, AppColors.gramSC);
  }

  factory Category.music(){
    return Category('Music', 'assets/images/music_logo.png',AppColors.musicBC, AppColors.musicBC);
  }

  factory Category.geography(){
    return Category('Geo', 'assets/images/geo_logo.png',AppColors.geoBC, AppColors.geoSC);
  }

}