import 'package:flutter/material.dart';
import 'package:my_book_finder/components/components.dart';


class BooksListScreen extends StatelessWidget {
  const BooksListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildBookItem();
  }
}
