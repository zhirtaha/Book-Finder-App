import 'package:flutter/material.dart';
import 'package:my_book_finder/models/book_model.dart';
import 'package:my_book_finder/styles/colors/colors.dart';

//build books items
Widget buildBookItem(Item item) {
  return Container(
    padding: EdgeInsets.all(25.0),
    decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            item.volumeInfo.imageLinks!.thumbnail.toString(),
          ),
        ),
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10.0)),
  );
}


//build categories List
Widget buildCategoriesListItem() {
  return Container();
}

//build carousel image items
Widget buildCarouselImageItems(String carouselImage, int index) {
  return Container(
    width: 360,
    margin: EdgeInsets.symmetric(horizontal: 5),
    color: Colors.grey,
    child: Image.network(
      carouselImage,
      fit: BoxFit.cover,
    ),
  );
}

//default button
Widget buildDefaultButton({
  double height = 50.0,
  double padding = 16.0,
  required Color backgroundColor,
  required Color shadowColor,
  required Color textColor,
  double radius = 15.0,
  required String? Function() function,
  required String text,
}) {
  return ElevatedButton(
    onPressed: function,
    style: ElevatedButton.styleFrom(
      onPrimary: textColor,
        primary: backgroundColor,
        padding: EdgeInsets.all(padding),
        shadowColor: shadowColor,
        shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(radius)
     ),
    ), 
    child: Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold
      ),
    ),
  );
}

//Navigate to a screen
void navigateTo(context, widget) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));
}

//Navigate and remove previous screen
void navigateAndFinish(context, widget) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => widget), (route) => false);
}
