import 'package:flutter/material.dart';
import 'package:islami/app_colors.dart';

class MyThemeData {
  //colors , light theme , dark theme
  static final ThemeData lightTheme = ThemeData(
      //canvasColor: AppColors.primaryLightColor,
      primaryColor: AppColors.primaryLightColor,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColors.blackColor,
        unselectedItemColor: AppColors.whitColor,
        //backgroundColor: AppColors.primaryLightColor,
      ),
      textTheme: TextTheme(
          bodyLarge: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor)));
}
