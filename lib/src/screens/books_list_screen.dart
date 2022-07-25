import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_book_finder/src/components/components.dart';
import 'package:my_book_finder/src/models/book_model.dart';
import 'package:my_book_finder/src/screens/book_detail_screen.dart';
import 'package:my_book_finder/src/services/book_api_service.dart';
import 'package:my_book_finder/src/styles/colors/colors.dart';

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
                return GestureDetector(
                  onTap: (() {
                    navigateTo(context,
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
              },
            ),
          );
        }),
      ),
    );
  }
}
