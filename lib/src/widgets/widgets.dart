import 'package:flutter/material.dart';
import 'package:my_book_finder/src/models/book_model.dart';
import 'package:my_book_finder/src/screens/book_detail_screen.dart';
import 'package:my_book_finder/src/styles/colors/colors.dart';
//build book item
Widget buildBookItem(Item item,BuildContext context) 
{
  return GestureDetector(
    onTap: (() {
      navigateTo(
        context,
        BookDetailScreen(
          description: item.volumeInfo.description,
          authors: item.volumeInfo.authors.toString(),
          image: item.volumeInfo.imageLinks?.thumbnail,
          title: item.volumeInfo.title,
          publisher: item.volumeInfo.publisher,
          publishedDate: item.volumeInfo.publishedDate,
          pageCount: item.volumeInfo.pageCount,
          averageRating: item.volumeInfo.averageRating,
          previewLink: item.volumeInfo.previewLink,
        ),
      );
    }),
    child: GridTile(
      footer: Container(
        padding: EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor.withOpacity(0.9),
        ),
        height: 40,
        child: Text(
          textAlign: TextAlign.center,
          item.volumeInfo.title,
          style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 18,
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
    ),
  );
}

//build carousel image items
Widget buildCarouselImageItems(String carouselImage, int index) {
  return Container(
    width: 360,
    margin: EdgeInsets.symmetric(horizontal: 5),
    color: Colors.grey,
    child: Image.asset(
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
void navigateAndRemove(context, widget) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => widget), (route) => false);
}

