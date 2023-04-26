import 'package:flutter/material.dart';

class AppColors {
  static const darkBlue = Color(0xFF00356B);
  static const darkOrange = Color(0xFFBD5319);
  static const darkGreen = Color(0xFF5F712D);
  static const darkGrey = Color(0xFF4A4A4A);
  static const lightGrey = Color(0xFF978D85);
  static const lightblue = Color(0xFFCCDCEC);
  static const offWhite = Color(0xFFDDDDDD);
  static const white = Color(0xFFF9F9F9);
  static const oliveGreen = Color.fromARGB(255, 128, 128, 0);
  //static const offBlue = Color(0x00DDDDDD);
}

// default padding
const double defaultPadding = 16;

// default elevation
const double defaultElevation = 8;

// default iconButton splash radius
const double defaultSplashRadius = 20;

// default circularRadius
const double defaultCircularRadius = 15;

// default Radius Card
const double defaultCircularRadiusCard = 10;

ThemeData get dateTimePickerTheme => ThemeData(
      textTheme: const TextTheme(
        labelSmall: TextStyle(fontSize: 20),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.lightblue,
        primary: AppColors.darkBlue,
      ),
    );
