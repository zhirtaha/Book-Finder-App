import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_book_finder/components/components.dart';
import 'package:my_book_finder/models/book_model.dart';
import 'package:my_book_finder/services/book_api_service.dart';
import 'package:my_book_finder/styles/colors/colors.dart';


class BooksListScreen extends StatelessWidget {
  const BooksListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            return buildBookItem(item);
          },
        );
      }),
    ),
  );
  }
}
