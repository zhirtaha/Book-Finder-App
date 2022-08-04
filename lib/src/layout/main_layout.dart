import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_book_finder/src/components/components.dart';
import 'package:my_book_finder/src/screens/books_list_screen.dart';
import 'package:my_book_finder/src/screens/home_screen.dart';
import 'package:my_book_finder/src/screens/categories_screen.dart';
import 'package:my_book_finder/src/screens/search_screen.dart';
import 'package:my_book_finder/src/screens/sign_in_screen.dart';
import 'package:my_book_finder/src/services/auth_service.dart';
import 'package:my_book_finder/src/styles/colors/colors.dart';

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
  Auth auth = Auth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'My Book Finder',
        ),
        actions: [
          IconButton(
              onPressed: () {
                auth.signOut();
                navigateAndRemove(context, SignInScreen());
              },
              icon: Icon(
                Icons.exit_to_app,
                color: secondaryColor,
              ))
        ],
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
              label: 'Home',
              // ignore: deprecated_member_use
              icon: FaIcon(FontAwesomeIcons.home)),
          BottomNavigationBarItem(
              label: 'Books', icon: FaIcon(FontAwesomeIcons.book)),
          BottomNavigationBarItem(
              label: 'Categories', icon: FaIcon(FontAwesomeIcons.list)),
          BottomNavigationBarItem(
              label: 'Search',
              // ignore: deprecated_member_use
              icon: FaIcon(FontAwesomeIcons.search)),
        ],
      ),
      body: bottomNavItems[currentIndex],
    );
  }
}
