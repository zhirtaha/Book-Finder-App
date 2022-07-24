import 'package:flutter/material.dart';
import 'package:my_book_finder/src/screens/books_list_screen.dart';
import 'package:my_book_finder/src/screens/home_screen.dart';
import 'package:my_book_finder/src/screens/categories_screen.dart';
import 'package:my_book_finder/src/screens/search_screen.dart';


class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;
  List bottomNavItems = [
    HomeScreen(),
    BooksListScreen(),
    CategoriesScreen(),
    SearchScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
      title: Text(
          'My Book Finder',
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              label: 'Home', icon: Icon(Icons.home)),
               BottomNavigationBarItem(
              label: 'Books', icon: Icon(Icons.book)),
          BottomNavigationBarItem(
              label: 'Categories', icon: Icon(Icons.list)),
          BottomNavigationBarItem(
              label: 'Search', icon: Icon(Icons.search)),
        ],
      ),
      body: bottomNavItems[currentIndex],
    );
  }
}
