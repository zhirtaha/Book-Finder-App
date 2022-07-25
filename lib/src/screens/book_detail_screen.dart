import 'package:flutter/material.dart';
import 'package:my_book_finder/src/components/components.dart';
import 'package:my_book_finder/src/screens/web_view_screen.dart';
import 'package:my_book_finder/src/styles/colors/colors.dart';

class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen({
    Key? key,
    this.authors,
    this.title,
    this.image,
    this.publisher,
    this.publishedDate,
    this.pageCount,
    this.averageRating,
    this.description,
    this.previewLink,
  }) : super(key: key);

  final String? authors;
  final String? title;
  final String? image;
  final String? publisher;
  final String? publishedDate;
  final int? pageCount;
  final num? averageRating;
  final String? description;
  final String? previewLink;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: accentColor,
          title: Text('Book Detail'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 45),
                    child: Image.network(
                      image!,
                      errorBuilder: (context, error, stackTrace) {
                        return Text('No Image');
                      },
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title!,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: accentColor),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Author : $authors',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: accentColor),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Publisher: $publisher',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: accentColor),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Published Date: $publishedDate',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: accentColor),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'number of Pages: $pageCount',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: accentColor),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Average Rating: $averageRating',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: accentColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Description',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: accentColor),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    border: Border.all(width: 1, color: accentColor),
                  ),
                  child: Text(
                    description ?? 'Description Not Available',
                    textAlign: TextAlign.justify,
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: accentColor, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 18),
                  padding: EdgeInsets.all(0),
                  child: buildDefaultButton(
                      backgroundColor: secondaryColor,
                      shadowColor: secondaryColor,
                      textColor: Colors.white,
                      function: () {
                        navigateTo(context, WebViewScreen(url: previewLink));
                        return null;
                      },
                      text: 'Preview')),
            ],
          ),
        ));
  }
}
