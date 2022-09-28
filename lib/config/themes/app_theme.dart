import 'package:flutter/material.dart';
import '../../core/utils/app_colors.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    hintColor: AppColors.hintphoneNumGrey,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    //fontFamily: AppStrings.fontFamily,
    // appBarTheme: const AppBarTheme(
    //     centerTitle: true,
    //     color: Colors.transparent,
    //     elevation: 0,
    //     titleTextStyle: TextStyle(
    //         fontWeight: FontWeight.w500, color: Colors.black, fontSize: 20)),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
          height: 1.3,
          fontSize: 22,
          color: Colors.white,
          fontWeight: FontWeight.bold),
    ),
  );
}
