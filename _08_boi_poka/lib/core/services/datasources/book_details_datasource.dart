import 'package:_08_boi_poka/core/utils/api_utils.dart';
import 'package:_08_boi_poka/models/google_books_model.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class BookDetailsDatasource {
  final apiUtils = ApiUtils();

  Future<List<GoogleBooksModel>> fetchBooksByAuthor(String author) async {
    try {
      ResponseModel response = await apiUtils.getGoogleBooksApi(
        baseUrl: "https://www.googleapis.com",
        endPoint:
            '/books/v1/volumes?q=author:$author&maxResult=10&key=${dotenv.env['GOOGLE_BOOK_API_KEY']}',
      );
      List<dynamic> data = response.response['items'];
      List<GoogleBooksModel> booksByAuthor =
          data.map((homeBook) => GoogleBooksModel.fromJson(homeBook)).toList();
      return booksByAuthor;
    } catch (e) {
      throw Exception("Error Occured While Fetching Books By Author : $e");
    }
  }

  Future<List<GoogleBooksModel>> fetchSimilarBooks(String category) async {
    try {
      ResponseModel response = await apiUtils.getGoogleBooksApi(
        baseUrl: "https://www.googleapis.com",
        endPoint:
            '/books/v1/volumes?q=subject:$category&key=${dotenv.env['GOOGLE_BOOK_API_KEY']!}&maxResult=10',
      );
      List<dynamic> data = response.response['items'] ?? [];
      List<GoogleBooksModel> similarBooks =
          data.map((homeBook) => GoogleBooksModel.fromJson(homeBook)).toList();
      return similarBooks;
    } catch (e) {
      print("Error Occured While Fetching Similar Books : $e");
      throw Exception("Error Occured While Fetching Similar Books: $e");
    }
  }
}
