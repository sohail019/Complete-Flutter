import 'package:_08_boi_poka/core/utils/api_utils.dart';

class SocialLoginDataSource {
  final ApiUtils apiUtils = ApiUtils();

  Future<ResponseModel> loginWithGoogle({
    required String displayName,
    required String email,
    required String phoneNumber,
    required String photoUrl,
    required String refreshToken,
    required String uid,
    required String deviceType,
    required String deviceId,
    required String notificationToken,
  }) async {
    ResponseModel data = await apiUtils.postApi(
      baseUrl: apiUtils.dio.options.baseUrl,
      endPoint: "/api/user/google",
      data: {
        "displayName": displayName,
        "email": email,
        "phoneNumber": phoneNumber,
        "photoUrl": photoUrl,
        "refreshToken": refreshToken,
        "uid": uid,
        "deviceType": deviceType,
        "deviceId": deviceId,
        "notificationToken": notificationToken,
      },
    );
    return data;
  }
}
