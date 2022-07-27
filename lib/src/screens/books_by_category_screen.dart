import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_book_finder/src/components/components.dart';
import 'package:my_book_finder/src/models/book_model.dart';
import 'package:my_book_finder/src/services/book_api_service.dart';
import 'package:my_book_finder/src/styles/colors/colors.dart';

class BooksByCategoryScreen extends StatelessWidget {
  const BooksByCategoryScreen({Key? key, required this.category})
      : super(key: key);

  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: accentColor,
        title: Text(category),
      ),
      body: Container(
        padding: EdgeInsets.all(25),
        child: FutureBuilder<BookModel>(
          future: BookService.getBooksBySubject(category),
          builder: ((context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SpinKitPouringHourGlassRefined(
                color: accentColor,
                size: 70.0,
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else if (snapshot.data == null) {
              return Text('There is No Data');
            }
            return GestureDetector(
              onTap: () {},
              child: GridView.builder(
                itemCount: snapshot.data.items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 25.0,
                    crossAxisSpacing: 25.0),
                itemBuilder: (context, index) {
                  Item item = snapshot.data.items[index];
                  return buildBookItem(item, context);
                },
              ),
            );
          }),
        ),
      ),
    );
  }
}
