import 'package:_08_boi_poka/core/utils/api_utils.dart';

class InterestsDatasource {
  final ApiUtils apiUtils = ApiUtils();

  Future<ResponseModel> storeGenreAndInterest({
    required List<String> genres,
    required Map<String, dynamic> interests,
  }) async {
    dynamic data = await apiUtils.putApi(
      endPoint: "/api/user/updateGenresAndInterests",
      baseUrl: apiUtils.dio.options.baseUrl,
      data: {"genres": genres, "interests": interests},
    );
    return data;
  }
}
