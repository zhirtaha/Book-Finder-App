import 'package:my_book_finder/models/book_model.dart';
import 'package:http/http.dart' as http;

class BookService {
  static Future<BookModel> getBooks() async {
    const url =
      'https://www.googleapis.com/books/v1/volumes?q="ab"&maxResults=10&orderBy=newest';
    final res = await http.get(Uri.parse(url));
    final responseBody = res.body;
    BookModel bookModel = bookModelFromJson(responseBody);
    return bookModel;
  }
}
