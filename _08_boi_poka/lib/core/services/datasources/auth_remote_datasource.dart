import 'dart:developer';

import 'package:_08_boi_poka/core/utils/api_utils.dart';
import 'package:flutter/material.dart';

class AuthRemoteDatasource {
  final ApiUtils apiUtils = ApiUtils();

  Future<ResponseModel> register({
    required String fullName,
    required String email,
    required String phoneNum,
    required String password,
    required BuildContext context,
  }) async {
    log("Hello b4");
    ResponseModel data = await apiUtils.postApi(
      baseUrl: apiUtils.dio.options.baseUrl,
      endPoint: "/api/user/register",
      data: {
        "fullName": fullName,
        "email": email,
        "mobileNumber": phoneNum,
        "password": password,
        "userType": "User",
      },
    );
    log("Register response: $data");
    return data;
  }
}
