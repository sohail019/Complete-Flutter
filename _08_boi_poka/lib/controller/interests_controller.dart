import 'package:_08_boi_poka/core/services/datasources/interests_datasource.dart';
import 'package:_08_boi_poka/core/services/datasources/shared_preference_impl.dart';
import 'package:_08_boi_poka/core/utils/api_utils.dart';

class InterestsController {
  final InterestsDatasource interestsDatasource = InterestsDatasource();

  final sharedPref = SharedPrefController();

  Future<ResponseModel> storeGenreAndInterests({
    required List<String> genres,
    required Map<String, dynamic> interests,
  }) async {
    ResponseModel data = await interestsDatasource.storeGenreAndInterest(
      genres: genres,
      interests: interests,
    );
    if (data.statusCode == 200 || data.statusCode == 201) {
      await sharedPref.storeBool("onBoarded", true);
    }
    return data;
  }
}
