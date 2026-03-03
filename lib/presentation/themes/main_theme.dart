import 'package:flutter/material.dart';
import 'package:hetro_anime/consts/my_colors.dart';

ThemeData mainTheme =ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: MyColors.mainColore),
  scaffoldBackgroundColor: MyColors.mainColore,
  appBarTheme: AppBarTheme(
    backgroundColor: MyColors.mainColore,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: MyColors.fontColors
    )
  )
);