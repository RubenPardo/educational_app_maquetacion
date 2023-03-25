import 'package:educational_app_maquetacion/presentation/pages/home_page.dart';
import 'package:educational_app_maquetacion/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        fontFamily: 'Roslindale',
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        textTheme: const TextTheme(
          labelMedium: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.textColorTag,fontFamily: 'Inter'),
          labelLarge: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: AppColors.textColorTag,fontFamily: 'Inter'),
          bodyMedium: TextStyle(color: AppColors.textColor, fontSize: 17, fontWeight: FontWeight.w700),
          headlineLarge: TextStyle(color: AppColors.textColor, fontSize: 28, fontWeight: FontWeight.w700),
          headlineMedium: TextStyle(color: AppColors.textColor, fontSize: 22, fontWeight: FontWeight.w700)
        )
      ),
      home: const HomePage()
    );
  }
}
