import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_book_finder/src/components/components.dart';
import 'package:my_book_finder/src/providers/my_provider.dart';
import 'package:my_book_finder/src/screens/sign_in_screen.dart';
import 'package:my_book_finder/src/services/auth_service.dart';
import 'package:my_book_finder/src/styles/colors/colors.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MainLayout extends StatelessWidget {
  MainLayout({Key? key}) : super(key: key);

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
        currentIndex:  Provider.of<MyProvider>(context).currentIndex ,
        onTap: (int index) {
          Provider.of<MyProvider>(context,listen: false).changeBottomNavItems(index);
        },
        items: [
          BottomNavigationBarItem(
              label: 'Home',
              icon: FaIcon(FontAwesomeIcons.house)),
          BottomNavigationBarItem(
              label: 'Books', icon: FaIcon(FontAwesomeIcons.book)),
          BottomNavigationBarItem(
              label: 'Categories', icon: FaIcon(FontAwesomeIcons.list)),
          BottomNavigationBarItem(
              label: 'Search',
              icon: FaIcon(FontAwesomeIcons.searchengin)),
        ],
      ),
      body:Provider.of<MyProvider>(context).bottomNavItems[ Provider.of<MyProvider>(context).currentIndex] ,
    );
  }
}
