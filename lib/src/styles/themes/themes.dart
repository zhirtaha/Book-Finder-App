import 'package:flutter/material.dart';
import 'package:my_book_finder/src/styles/colors/colors.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  fontFamily: 'Poppins',
  primaryColor: backgroundColor,
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 35.0,
      fontWeight: FontWeight.bold,
      color: accentColor
    ),
    bodyText1: TextStyle(
      fontSize: 18,
      color: accentColor
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: backgroundColor,
    elevation: 5.0,
   titleTextStyle: TextStyle(
    color: accentColor,
    fontWeight: FontWeight.bold,
    fontSize: 18.0
   )
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 15.0,
    unselectedItemColor: Colors.grey[600],
    selectedItemColor: secondaryColor,
    type: BottomNavigationBarType.fixed,
    backgroundColor: backgroundColor,
  ),
);
