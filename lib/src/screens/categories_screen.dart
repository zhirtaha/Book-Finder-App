import 'package:flutter/material.dart';
import 'package:my_book_finder/src/models/book_model.dart';
import 'package:my_book_finder/src/services/book_api_service.dart';
import 'package:my_book_finder/src/styles/colors/colors.dart';

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
    CategoriesModel(image: 'assets/images/art.png', title: 'ART'),
    CategoriesModel(image: 'assets/images/criticism.png', title: 'CRITICISM'),
    CategoriesModel(image: 'assets/images/fiction.png', title: 'FICTION'),
    CategoriesModel(image: 'assets/images/history.png', title: 'HISTORY'),
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
          tileColor:backgroundColor,
           leading: Image.asset(categoriesModel[index].image),
           title: Text(categoriesModel[index].title),
           trailing: IconButton(
            onPressed: (){},
            icon: Icon(Icons.arrow_forward),
           ),
          );
        },
      ),
    );
  }
}
