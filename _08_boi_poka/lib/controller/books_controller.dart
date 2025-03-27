import 'dart:developer';

import 'package:_08_boi_poka/core/services/datasources/books_datasource.dart';
import 'package:_08_boi_poka/core/utils/api_utils.dart';
import 'package:_08_boi_poka/models/get_all_books_model.dart';
import 'package:_08_boi_poka/models/get_all_library_model.dart';
import 'package:_08_boi_poka/models/get_book_analytics_model.dart';
import 'package:_08_boi_poka/models/similar_books_model.dart';

class BooksController {
  final booksDatasource = BooksDataSource();

  Future<GetAllBooksModel> getAllBooks({
    List<String>? genres,
    List<String>? authors,
    String? bookType,
    String? pageNo,
    String? sortType,
    String? libraryId,
    String? sortBy,
    String? searchTitle,
  }) async {
    ResponseModel response = await booksDatasource.getAllBooksData(
      genres: genres,
      authors: authors,
      bookType: bookType,
      pageNo: pageNo,
      sortType: sortType,
      libraryId: libraryId,
      sortBy: sortBy,
      searchTitle: searchTitle,
    );
    GetAllBooksModel allBooks = GetAllBooksModel.fromJson(response.response);
    return allBooks;
  }

  Future<GetAllLibraryModel> getAllLibraries() async {
    GetAllLibraryModel data = await booksDatasource.getAllLibraries();
    return data;
  }

  Future<GetAllLibraryModel> getAllMemberLibrary({
    required String userId,
  }) async {
    ResponseModel data = await booksDatasource.getAllMemberLibrary(
      userId: userId,
    );
    GetAllLibraryModel allGenre = GetAllLibraryModel.fromJson(data.response);
    return allGenre;
  }

  Future<GetAllBooksModel> getMemberAllBook({
    required String userId,
    List<String>? genres,
    List<String>? authors,
    String? bookType,
    String? pageNo,
    String? sortType,
    String? libraryId,
    String? sortBy,
    String? searchTitle,
  }) async {
    ResponseModel data = await booksDatasource.getMemberAllBook(
      userId: userId,
      authors: authors,
      bookType: bookType,
      genres: genres,
      pageNo: pageNo,
      sortType: sortType,
      libraryId: libraryId,
      sortBy: sortBy,
      searchTitle: searchTitle,
    );
    return GetAllBooksModel.fromJson(data.response);
  }

  Future<List<SimilarBooksModel>> getSimilarBooks({
    required String bookId,
  }) async {
    List<SimilarBooksModel> data = await booksDatasource.getSimilarBooks(
      bookId: bookId,
    );
    return data;
  }

  Future<List<SimilarBooksModel>> getBooksByAuthor({
    required String bookId,
  }) async {
    List<SimilarBooksModel> data = await booksDatasource.getBooksByAuthor(
      bookId: bookId,
    );
    return data;
  }

  Future<GetBookAnalyticsModel> getBookAnalytics({
    required String bookId,
  }) async {
    GetBookAnalyticsModel data = await booksDatasource.getBookAnalytics(
      bookId: bookId,
    );
    log("Get Books By Author - $data");
    return data;
  }
}
