import 'package:flutter/material.dart';
import 'package:my_book_finder/src/layout/main_layout.dart';
import 'package:my_book_finder/src/screens/on_boarding_screen.dart';
import 'package:my_book_finder/src/styles/themes/themes.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'My Book finder' ,
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      home:MainLayout() ,
    );
  }
}
