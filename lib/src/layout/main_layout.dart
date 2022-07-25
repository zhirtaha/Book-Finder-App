import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
              // ignore: deprecated_member_use
              label: 'Home', icon: FaIcon(FontAwesomeIcons.home)),
               BottomNavigationBarItem(
              label: 'Books', icon: FaIcon(FontAwesomeIcons.book)),
          BottomNavigationBarItem(
              label: 'Categories', icon: FaIcon(FontAwesomeIcons.list)),
          BottomNavigationBarItem(
              // ignore: deprecated_member_use
              label: 'Search', icon: FaIcon(FontAwesomeIcons.search)),
        ],
      ),
      body: bottomNavItems[currentIndex],
    );
  }
}
