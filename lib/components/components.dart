import 'package:flutter/material.dart';
import 'package:my_book_finder/models/book_model.dart';
import 'package:my_book_finder/services/book_api_service.dart';
import 'package:my_book_finder/styles/colors/colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

//build books items
Widget buildBookItem() {
  return Container(
    padding: EdgeInsets.all(25.0),
    child: FutureBuilder<BookModel>(
      future: BookService.getBooks(),
      builder: ((context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SpinKitWave(
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: accentColor,
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else if (snapshot.data == null) {
          return Text('There is No Data');
        }
        return GridView.builder(
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 25.0, crossAxisSpacing: 25.0),
          itemBuilder: (context, index) {
            Item item = snapshot.data.items[index];
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
          },
        );
      }),
    ),
  );
}

//build Search box item
Widget buildSearchBoxItem() {
  return Container();
}

//build categories List
Widget buildCategoriesListItem() {
  return Container();
}

//build carousel image items
Widget buildCarouselImageItems(String carouselImage, int index) {
  return Container(
    width: 360,
    margin: EdgeInsets.symmetric(horizontal: 10),
    color: Colors.grey,
    child: Image.network(
      carouselImage,
      fit: BoxFit.cover,
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
