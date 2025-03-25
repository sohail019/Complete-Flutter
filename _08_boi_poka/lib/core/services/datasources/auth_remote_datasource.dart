import 'package:_08_boi_poka/core/utils/api_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthRemoteDatasource {
  final ApiUtils apiUtils = ApiUtils();

  Future<ResponseModel> register({
    required String fullName,
    required String email,
    required String phoneNum,
    required String password,
    required BuildContext context,
  }) async {
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
    return data;
  }

  Future<ResponseModel> loginWithPhoneNumber({
    required String phoneNum,
    required String password,
    required BuildContext context,
  }) async {
    ResponseModel data = await apiUtils.postApi(
      baseUrl: apiUtils.dio.options.baseUrl,
      endPoint: "/api/user/login",
      data: {"mobileNumber": phoneNum, "password": password},
    );

    return data;
  }

  Future<dynamic> getNewToken({required String refreshToken}) async {
    try {
      String baseUrl = dotenv.env['BaseURL']!;
      final Uri uri = Uri.parse("$baseUrl/api/auth/refreshToken");
      final Response response = await Dio().postUri(
        uri,
        data: {"refreshToken": refreshToken},
      );
      ResponseModel responseData = ResponseModel(
        response: response.data,
        statusCode: response.statusCode!,
      );
      return responseData;
    } catch (e) {
      rethrow;
    }
  }
}
