// ignore_for_file: implementation_imports

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/icon_theme_data.dart';
import 'package:flutter/src/material/text_theme.dart';
import 'package:flutter/src/material/outlined_button_theme.dart';
import 'package:flutter/src/material/elevated_button_theme.dart';
import 'package:flutter/src/material/app_bar_theme.dart';
import 'package:qatra/theme/app_colors.dart';
import 'package:qatra/theme/app_theme.dart';

class AppLightTheme implements AppTheme {
  @override
  Brightness brightness = Brightness.light;
  @override
  Color backgroundColor = AppColors.lightBackground;
  @override
  Color scaffoldBackgroundColor = AppColors.lightBackground;
  @override
  Color bottomAppBarColor = AppColors.button;
  @override
  Color dividerColor = AppColors.button;
  @override
  IconThemeData iconTheme = const IconThemeData(color: AppColors.button);

  @override
  AppBarTheme appBarTheme = const AppBarTheme(
    color: AppColors.button,
    centerTitle: true,
  );

  @override
  ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(AppColors.button),
          textStyle: MaterialStateProperty.all<TextStyle>(
            const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)))));

  @override
  OutlinedButtonThemeData outlinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 20),
          textStyle: const TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
          side: const BorderSide(width: 1.0, color: AppColors.button)));

  @override
  TextTheme textTheme = const TextTheme(
      //Headline
      titleLarge: TextStyle(
        fontSize: 18,
        color: AppColors.lightText,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: AppColors.lightText,
      ),
      titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.lightText));

  @override
  BottomNavigationBarThemeData bottomNavigationBarThemeData =
      const BottomNavigationBarThemeData(
          backgroundColor: AppColors.button,
          elevation: 2,
          selectedItemColor: AppColors.darkBackground,
          unselectedItemColor: AppColors.darkText,
          type: BottomNavigationBarType.fixed);
}
