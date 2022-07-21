import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_book_finder/screens/books_list_screen.dart';
import 'package:my_book_finder/screens/categories_screen.dart';
import 'package:my_book_finder/screens/home_screen.dart';
import 'package:my_book_finder/screens/search_screen.dart';

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
              label: 'Home', icon: FaIcon(FontAwesomeIcons.house)),
               BottomNavigationBarItem(
              label: 'Books', icon: FaIcon(FontAwesomeIcons.book)),
          BottomNavigationBarItem(
              label: 'Categories', icon: FaIcon(FontAwesomeIcons.list)),
          BottomNavigationBarItem(
              label: 'Search', icon: FaIcon(FontAwesomeIcons.searchengin)),
        ],
      ),
      body: bottomNavItems[currentIndex],
    );
  }
}
