import 'dart:developer';

import 'package:_08_boi_poka/core/utils/api_utils.dart';
import 'package:_08_boi_poka/models/user_profile_model.dart';

class UserDatasource {
  final apiUtils = ApiUtils();

  Future<UserProfileModel> getProfileData() async {
    ResponseModel data = await apiUtils.getApi(
      baseUrl: apiUtils.dio.options.baseUrl,
      endPoint: "/api/user/getUser",
    );
    log("User Profile Data - $data");
    return UserProfileModel.fromJson(data.response);
  }
}
