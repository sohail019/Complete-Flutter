import 'package:_08_boi_poka/core/utils/api_utils.dart';

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
}
