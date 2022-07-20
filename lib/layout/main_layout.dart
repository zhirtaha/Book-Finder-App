import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_book_finder/screens/books_list_screen.dart';
import 'package:my_book_finder/screens/categories_screen.dart';
import 'package:my_book_finder/screens/home_screen.dart';
import 'package:my_book_finder/screens/search_screen.dart';
import 'package:my_book_finder/styles/colors/colors.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
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
        backgroundColor: backgroundColor,
        elevation: 0.0,
        title: Text(
          'Book Finder',
          style: TextStyle(fontWeight: FontWeight.bold, color: accentColor),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        elevation: 15.0,
        selectedItemColor: secondaryColor,
        unselectedItemColor: Colors.grey[600],
        backgroundColor: backgroundColor,
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
