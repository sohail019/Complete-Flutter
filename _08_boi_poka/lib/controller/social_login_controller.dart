import 'package:_08_boi_poka/core/services/datasources/social_login_datasource.dart';
import 'package:_08_boi_poka/core/utils/api_utils.dart';

class SocialLoginController {
  final socialLoginDatasource = SocialLoginDataSource();

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
    ResponseModel data = await socialLoginDatasource.loginWithGoogle(
      displayName: displayName,
      deviceId: deviceId,
      deviceType: deviceType,
      email: email,
      notificationToken: notificationToken,
      phoneNumber: phoneNumber,
      photoUrl: photoUrl,
      refreshToken: refreshToken,
      uid: uid,
    );
    return data;
  }
}
