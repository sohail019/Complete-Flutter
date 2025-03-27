import 'package:_08_boi_poka/core/services/datasources/user_datasource.dart';
import 'package:_08_boi_poka/models/user_profile_model.dart';

class UserController {
  final userDatasource = UserDatasource();

  Future<UserProfileModel> getProfileData() async {
    UserProfileModel response = await userDatasource.getProfileData();
    return response;
  }
}
