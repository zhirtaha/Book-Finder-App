import 'package:flutter/material.dart';
import 'package:my_book_finder/src/screens/books_by_category_screen.dart';
import 'package:my_book_finder/src/styles/colors/colors.dart';
import 'package:my_book_finder/src/widgets/widgets.dart';

class CategoriesModel {
  String image;
  String title;
  CategoriesModel({
    required this.image,
    required this.title,
  });
}

// ignore: must_be_immutable
class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);

  List<CategoriesModel> categoriesModel = [
    CategoriesModel(image: 'assets/images/art.png', title: 'DESIGN'),
    CategoriesModel(image: 'assets/images/criticism.png', title: 'CRITICISM'),
    CategoriesModel(image: 'assets/images/history.png', title: 'HISTORY'),
    CategoriesModel(image: 'assets/images/law.png', title: 'LAW'),
    CategoriesModel(image: 'assets/images/music.png', title: 'MUSIC'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: ListView.separated(
        itemCount: categoriesModel.length,
        separatorBuilder: (context, index) {
          return Divider(
            height: 25,
            color: accentColor,
          );
        },
        itemBuilder: (context, index) {
          return ListTile(
            textColor: accentColor,
            iconColor: secondaryColor,
            tileColor: backgroundColor,
            leading: Image.asset(categoriesModel[index].image),
            title: Text(categoriesModel[index].title),
            trailing: IconButton(
              onPressed: () {
                navigateTo(context, BooksByCategoryScreen(category: categoriesModel[index].title));
              },
              icon: Icon(Icons.arrow_forward),
            ),
          );
        },
      ),
    );
  }
}
