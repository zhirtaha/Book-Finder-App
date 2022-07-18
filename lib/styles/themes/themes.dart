import 'package:flutter/material.dart';
import 'package:my_book_finder/styles/colors/colors.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: 'Poppins',
  primaryColor: primaryColor,
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
);
