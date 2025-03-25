import 'package:_08_boi_poka/core/services/datasources/books_datasource.dart';
import 'package:_08_boi_poka/core/utils/api_utils.dart';
import 'package:_08_boi_poka/models/get_all_books_model.dart';

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
}
