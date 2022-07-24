import 'package:flutter/material.dart';
import 'package:my_book_finder/src/models/book_model.dart';
import 'package:my_book_finder/src/styles/colors/colors.dart';


//build books items
Widget buildBookItem(Item item) {
  return GridTile(
    footer: Container(
      padding: EdgeInsets.all(5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundColor.withOpacity(0.8),
        
      ),
      height: 45,
      child: Text(
        textAlign: TextAlign.center,
        item.volumeInfo.title,
        style: TextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: 16,
            fontWeight: FontWeight.bold),
      ),
    ),
    child: Image.network(
      item.volumeInfo.imageLinks!.thumbnail.toString(),
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Placeholder();
      },
    ),
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
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
    ),
    child: Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold),
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
