import 'dart:developer';

import 'package:_08_boi_poka/core/utils/api_utils.dart';
import 'package:_08_boi_poka/models/get_all_library_model.dart';
import 'package:_08_boi_poka/models/get_book_analytics_model.dart';
import 'package:_08_boi_poka/models/similar_books_model.dart';

class BooksDataSource {
  final apiUtils = ApiUtils();

  Future<ResponseModel> getAllBooksData({
    required List<String>? genres,
    required List<String>? authors,
    required String? bookType,
    required String? pageNo,
    required String? sortType,
    required String? libraryId,
    required String? sortBy,
    required String? searchTitle,
  }) async {
    ResponseModel response = await apiUtils.getApi(
      baseUrl: apiUtils.dio.options.baseUrl,
      endPoint: "/api/userbook/getAllBooks?page=$pageNo",
      data: {
        "genres": genres,
        "authors": authors,
        "type": bookType, //eBook, audioBook, physicalBook
        "sortOrder": sortType, //asc, desc
        "libraryId": libraryId,
        "sortBy": sortBy,
        "searchTitle": searchTitle,
      },
    );
    return response;
  }

  //? Get All Libraries
  Future<GetAllLibraryModel> getAllLibraries() async {
    ResponseModel data = await apiUtils.getApi(
      baseUrl: apiUtils.dio.options.baseUrl,
      endPoint: "/api/userbook/getAllLibraries",
    );
    return GetAllLibraryModel.fromJson(data.response);
  }

  //? Get All Member Library
  Future<ResponseModel> getAllMemberLibrary({required String userId}) async {
    ResponseModel data = await apiUtils.getApi(
      baseUrl: apiUtils.dio.options.baseUrl,
      endPoint: "/api/innercircle/getMembersAllLibraries/$userId",
    );
    log("Get Member All Library - $data");
    return data;
  }

  //? Get Member All Book
  Future<ResponseModel> getMemberAllBook({
    required String userId,
    required List<String>? genres,
    required List<String>? authors,
    required String? bookType,
    required String? pageNo,
    required String? sortType,
    required String? libraryId,
    required String? sortBy,
    required String? searchTitle,
  }) async {
    ResponseModel data = await apiUtils.getApi(
      baseUrl: apiUtils.dio.options.baseUrl,
      endPoint: "/api/innercircle/getMembersUserBook/$userId",
      data: {
        "genres": genres,
        "authors": authors,
        "type": bookType, //eBook, audioBook
        "sortOrder": sortType, //asc
        "libraryId": libraryId,
        "sortBy": sortBy,
        "searchTitle": searchTitle,
      },
    );
    return data;
  }

  //? Get Book Analytics
  Future<GetBookAnalyticsModel> getBookAnalytics({
    required String bookId,
  }) async {
    ResponseModel data = await apiUtils.getApi(
      baseUrl: apiUtils.dio.options.baseUrl,
      endPoint: "/api/book/getBookAnalytics?bookId=$bookId",
    );
    return GetBookAnalyticsModel.fromJson(data.response);
  }

  Future<List<SimilarBooksModel>> getSimilarBooks({
    required String bookId,
  }) async {
    ResponseModel data = await apiUtils.getApi(
      baseUrl: apiUtils.dio.options.baseUrl,
      endPoint: "/api/book/similarBooks?bookId=$bookId",
    );
    List<dynamic> authorBooks = data.response['data'];
    List<SimilarBooksModel> bookData =
        authorBooks.map((e) => SimilarBooksModel.fromJson(e)).toList();
    log("Get Similar Books - $data");

    return bookData;
  }

  Future<List<SimilarBooksModel>> getBooksByAuthor({
    required String bookId,
  }) async {
    ResponseModel data = await apiUtils.getApi(
      baseUrl: apiUtils.dio.options.baseUrl,
      endPoint: "/api/book/author?bookId=$bookId",
    );
    List<dynamic> authorBooks = data.response['data'];
    List<SimilarBooksModel> bookData =
        authorBooks.map((e) => SimilarBooksModel.fromJson(e)).toList();

    log("Get Books By Author- $bookData");

    return bookData;
  }
}
