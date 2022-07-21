import 'package:flutter/material.dart';
import 'package:my_book_finder/models/book_model.dart';
import 'package:my_book_finder/services/book_api_service.dart';

class BooksListScreen extends StatelessWidget {
  const BooksListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: FutureBuilder<BookModel>(
        future: BookService.getBooks(),
        builder: ((context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else if (snapshot.data == null) {
            return Text('There is No Data');
          }
          return Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data.items.length,
              itemBuilder: (context, index) {
                Item item = snapshot.data.items[index];
                return Image.network(
                    item.volumeInfo.imageLinks!.thumbnail.toString());
              },
            ),
          );
        }),
      ),
    );
  }
}
