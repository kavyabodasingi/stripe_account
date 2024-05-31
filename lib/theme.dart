import 'package:flutter/material.dart';
class ThemeClass{
  Color lightPrimaryColor = Colors.blue;//light theme
  Color secondaryColor = Colors.green;
  Color acccentColor = Colors.amberAccent;
  Color darkPrimaryColor = Colors.black;
  static ThemeData lightTheme=ThemeData(
    primaryColor: ThemeData.light().scaffoldBackgroundColor,
    colorScheme: const ColorScheme.light(
          primary: Colors.blue,
          secondary: Colors.green,
          background: Colors.white,
          surface:Colors.grey)
  );

  static ThemeData darkTheme =ThemeData(
    primaryColor: ThemeData.dark().scaffoldBackgroundColor,
    colorScheme: const ColorScheme.dark(
      primary: Colors.blue,
      background: Colors.black,
      secondary:Colors.green,
      surface: Colors.grey,
  
    )
  );
}

ThemeClass _themeClass =ThemeClass();