import 'dart:developer';

import 'package:_08_boi_poka/core/utils/api_utils.dart';
import 'package:_08_boi_poka/models/get_all_library_model.dart';

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
}
