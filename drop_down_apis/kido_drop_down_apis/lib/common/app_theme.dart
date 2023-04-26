import 'package:flutter/material.dart';

TextStyle montserratBold = const TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: Colors.blue,
);

TextStyle montserratNormalColored = const TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.normal,
  color: Colors.blue,
);

TextStyle montserratNormal = const TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.normal,
  color: Colors.blue,
);

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
        seedColor: Colors.blue,
        primary: Colors.blue,
      ),
    );
