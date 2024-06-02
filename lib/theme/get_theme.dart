import 'package:flutter/material.dart';
import 'package:qatra/theme/app_theme.dart';

ThemeData getTheme<T extends AppTheme>(T theme) => ThemeData(
    dialogBackgroundColor: theme.backgroundColor,
    scaffoldBackgroundColor: theme.scaffoldBackgroundColor,
    textTheme: theme.textTheme,
    appBarTheme: theme.appBarTheme,
    bottomAppBarTheme: BottomAppBarTheme(color: theme.bottomAppBarColor),
    iconTheme: theme.iconTheme,
    brightness: theme.brightness,
    elevatedButtonTheme: theme.elevatedButtonTheme,
    outlinedButtonTheme: theme.outlinedButtonTheme,
    dividerColor: theme.dividerColor);
