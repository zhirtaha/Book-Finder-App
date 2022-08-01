import 'package:flutter/material.dart';
import 'package:my_book_finder/src/layout/main_layout.dart';
import 'package:my_book_finder/src/screens/on_boarding_screen.dart';
import 'package:my_book_finder/src/styles/themes/themes.dart';

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
 MyApp({Key? key, required  this.isLogin}) : super(key: key);
  bool? isLogin;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Book finder',
      theme: lightTheme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: isLogin == false ? OnBoardingScreen() : MainLayout(),
    );
  }
}
