import 'package:flutter/material.dart';
import 'package:my_book_finder/src/screens/books_list_screen.dart';
import 'package:my_book_finder/src/screens/categories_screen.dart';
import 'package:my_book_finder/src/screens/home_screen.dart';
import 'package:my_book_finder/src/screens/search_screen.dart';

class MyProvider with ChangeNotifier {
  int currentIndex = 0;

  List bottomNavItems = [
    HomeScreen(),
    BooksListScreen(),
    CategoriesScreen(),
    SearchScreen(),
  ];
  void changeBottomNavItems(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
