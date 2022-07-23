import 'package:flutter/material.dart';
import 'package:my_book_finder/layout/main_layout.dart';
import 'package:my_book_finder/styles/themes/themes.dart';

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
