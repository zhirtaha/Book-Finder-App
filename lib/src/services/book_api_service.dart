import 'package:http/http.dart' as http;
import 'package:my_book_finder/src/models/book_model.dart';

class BookService {
  static Future<BookModel> getBooks() async {
    var url =
        'https://www.googleapis.com/books/v1/volumes?q=bird&maxResults=20&orderBy=newest';
    final res = await http.get(Uri.parse(url));
    final responseBody = res.body;
    BookModel bookModel = bookModelFromJson(responseBody);
    return bookModel;
  }

  static Future<BookModel> getBooksBySearch(
      String book, String maxResult, String orderBy, String filter) async {
      var url =
          'https://www.googleapis.com/books/v1/volumes?q="$book"&maxResults=$maxResult&orderBy=$orderBy&filter=$filter';
      final res = await http.get(Uri.parse(url));
      final resposeBody = res.body;
      BookModel bookModel = bookModelFromJson(resposeBody);
      return bookModel;
  }

  static Future<BookModel> getBooksBySubject(String subject) async { 
      var url = 'https://www.googleapis.com/books/v1/volumes?q=subect:$subject';
      final res = await http.get(Uri.parse(url));
      final responseBody = res.body;
      BookModel bookModel = bookModelFromJson(responseBody);
      return bookModel;
  }
}
