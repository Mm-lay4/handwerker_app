import 'package:flutter/material.dart';

class AppColor {
  static Color kPrimaryButtonColor = const Color.fromARGB(255, 224, 142, 60);
  static Color kPrimary = const Color.fromARGB(255, 98, 98, 98);
  static Color kWhite = Colors.white;
  static Color kBlack = Colors.black;
  static Color kTextfieldBorder = const Color.fromARGB(255, 220, 217, 217);
  static Color kWhiteWOpacity = const Color.fromARGB(192, 255, 255, 255);
  static Color kBlue = Colors.blue;
  static Color kRed = Colors.red;
  Color get white => Colors.white;
  Color get black => Colors.black;
  static const appbarGreen = Color.fromARGB(255, 76, 141, 95);

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: Colors.teal,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: Colors.black,
      ),
    ),
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: Colors.white,
      ),
    ),
  );
}
