import "dart:developer";
import "dart:io";

import "package:_08_boi_poka/constants/app_colors.dart";
import "package:_08_boi_poka/constants/app_typography.dart";
import "package:_08_boi_poka/controller/auth_remote_controller.dart";
import "package:_08_boi_poka/controller/secure_storage_controller.dart";
import "package:_08_boi_poka/core/services/datasources/shared_preference_impl.dart";
import "package:_08_boi_poka/main.dart" as main;
import "package:_08_boi_poka/screens/auth/signin_screen/signin_screen.dart";
import "package:dio/dio.dart";
import "package:flutter/material.dart";
import "package:flutter_dotenv/flutter_dotenv.dart";

class ApiUtils {
  final SecureStorageController _storage = SecureStorageController();
  final Dio dio = Dio(
    BaseOptions(
      connectTimeout: Duration(seconds: 300),
      baseUrl: dotenv.env['BaseURL']!,
    ),
  );

  ApiUtils() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (
          RequestOptions options,
          RequestInterceptorHandler handler,
        ) async {
          //? Add the authorization header with token to each request
          String? token = await _storage.getSecureData(key: "jwtToken");
          if (token != null) {
            final String? tokenExpiryDate = await _storage.getSecureData(
              key: "tokenExpiryDate",
            );
            bool updateToken = await verifyToken(tokenExpiryDate!);
            if (updateToken) {
              final refreshToken = await _storage.getSecureData(
                key: "refreshToken",
              );
              final authRemote = AuthRemoteController();
              ResponseModel? data = await authRemote
                  .getNewToken(refreshToken: refreshToken!)
                  .onError((DioException error, stackTrace) {
                    String message = error.response!.data["message"];

                    if (error.response!.statusCode == 403 ||
                        error.response!.statusCode == 401) {
                      // Delete login credentials
                      final secureController = SecureStorageController();
                      final sharedPrefController = SharedPrefController();

                      secureController.deleteSecureData(key: "jwtToken");
                      secureController.deleteSecureData(key: "refreshToken");
                      secureController.deleteSecureData(key: "tokenExpiryDate");
                      sharedPrefController.deleteData("isLogin");

                      main.globalNavigatorKey.currentState!.push(
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  SigninScreen(errorMessage: "Session Expired"),
                        ),
                      );
                    }
                    main.scaffoldMessengerKey.currentState?.showSnackBar(
                      SnackBar(
                        content: Text(message),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return null;
                  });

              if (data != null) {
                token = data.response["data"]["token"];
                _storage.storeSecureData(key: "jwtToken", value: token!);
                _storage.storeSecureData(
                  key: "refreshToken",
                  value: data.response["data"]["refreshToken"],
                );
                _storage.storeSecureData(
                  key: "tokenExpiryDate",
                  value: data.response["data"]["tokenExpiryDate"],
                );
              }
              //? if token is expired then transfer page to login page
            }
            options.headers["Authorization"] = "Bearer $token";
            options.headers["Content-Type"] = "application/json";
          }
          //? In case if no token is present in the device
          return handler.next(options);
        },

        onResponse: (Response response, ResponseInterceptorHandler handler) {
          return handler.next(
            response,
          ); // Pass the response to the next handler
        },
        onError: (DioException error, ErrorInterceptorHandler handler) async {
          _handleError(error);
          return handler.next(error);
        },
      ),
    );
  }

  //? Method to make a get request to the API
  Future<ResponseModel> getApi({
    required String baseUrl,
    required String endPoint,
    Object? data,
  }) async {
    try {
      // String? token =
      //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImZmOWIwM2VlLWM5YTUtNGRjNS1iM2MwLTIzZjEwZTQ3YWYxNSIsInJvbGUiOiJVc2VyIiwiaWF0IjoxNzQyODg0MTU3LCJleHAiOjE3NDI5NzA1NTd9.c3KsN4fUIrHrePq3w1058547-Wvtv9GcE878i5uK9rQ";

      String? token = await _storage.getSecureData(key: "jwtToken");
      log("Token: $token");

      final Uri uri = Uri.parse("$baseUrl$endPoint");
      final Response response = await dio.getUri(
        uri,
        data: data,
        // options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      ResponseModel responseData = ResponseModel(
        statusCode: response.statusCode!,
        response: response.data,
      );
      return responseData;
    } catch (e) {
      rethrow;
    }
  }

  //? Method to make a post request to the API
  Future<ResponseModel> postApi({
    String? baseUrl,
    Map<String, dynamic>? data,
    File? file,
    FormData? formData,
    required String endPoint,
  }) async {
    try {
      // String? token = await _storage.getSecureData;
      // baseUrl = baseUrl ?? dotenv.env["BaseURL"]!;
      final Uri uri = Uri.parse("$baseUrl$endPoint");
      log("API Request to: $uri");
      log("Request Data: ${data ?? formData}");
      log(endPoint.toString());
      final Response response = await dio.postUri(uri, data: data ?? formData);

      ResponseModel responseData = ResponseModel(
        statusCode: response.statusCode!,
        response: response.data,
      );
      return responseData;
    } catch (e) {
      rethrow;
    }
  }

  //? Method to make a put request to the API
  Future<ResponseModel> putApi({
    required String endPoint,
    Map<String, dynamic>? data,
    String? baseUrl,
    File? file,
    FormData? formData,
    String? token,
  }) async {
    try {
      // baseUrl = baseUrl ?? dotenv.env["BaseURL"]!;

      final Uri uri = Uri.parse("$baseUrl$endPoint");
      final Response response = await dio.putUri(uri, data: data ?? formData);
      ResponseModel responseData = ResponseModel(
        statusCode: response.statusCode!,
        response: response.data,
      );
      return responseData;
    } catch (e) {
      rethrow;
    }
  }

  //? Method to make a patch request to the API because patch is similar to put request but with a few differences like patch is used to update a resource partially and put is used to update a resource completely

  Future<ResponseModel> patchApi({
    required String endPoint,
    required Map<String, dynamic> data,
    String? baseUrl,
    Map<String, String>? query,
  }) async {
    try {
      // baseUrl = baseUrl ?? dotenv.env["BaseURL"]!;
      final Uri uri = Uri.parse("$baseUrl$endPoint");
      final Response response = await dio.patchUri(uri, data: data);
      ResponseModel responseData = ResponseModel(
        statusCode: response.statusCode!,
        response: response.data,
      );
      return responseData;
    } catch (e) {
      rethrow;
    }
  }

  //? Method to make a delete request to the API
  Future<dynamic> deleteApi({
    required String endPoint,
    Map<String, dynamic>? data,
    String? baseUrl,
  }) async {
    try {
      // baseUrl = baseUrl ?? dotenv.env["BaseURL"]!;
      final Uri uri = Uri.parse("$baseUrl$endPoint");
      final Response response = await dio.deleteUri(
        uri,
        data: data,
        options: Options(headers: {"Content-Type": "application/json"}),
      );

      ResponseModel responseData = ResponseModel(
        statusCode: response.statusCode!,
        response: response.data,
      );
      return responseData;
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseModel> getGoogleBooksApi({
    required String baseUrl,
    required String endPoint,
  }) async {
    try {
      final Uri uri = Uri.parse("$baseUrl$endPoint");
      final Response response = await Dio().getUri(
        uri,
        // options: Options(
        //   headers: {
        //     "Content-Type": "application/json",
        //   },
        // ),
      );
      ResponseModel responseData = ResponseModel(
        statusCode: response.statusCode!,
        response: response.data,
      );
      return responseData;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> verifyToken(String dateTimeString) async {
    DateTime givenTime = DateTime.parse(dateTimeString).toUtc();
    DateTime now = DateTime.now().toUtc();
    Duration difference = givenTime.difference(now);

    //? Return true if token is expired or will expire within 30 mins
    return difference.inMinutes <= 30;
  }

  void _handleError(DioException e) {
    String message = "An error occurred";
    if (e.response != null) {
      switch (e.response?.statusCode) {
        case 400:
          message =
              e.response?.data['message']?.isNotEmpty == true
                  ? e.response?.data['message']
                  : "Invalid Credentials";
          break;
        case 401:
          message =
              e.response?.data['message']?.isNotEmpty == true
                  ? e.response?.data['message']
                  : "Unauthorized: Please login again";
          break;
        case 404:
          message =
              e.response?.data['message']?.isNotEmpty == true
                  ? e.response?.data['message']
                  : "Not Found: Requested resource not available";
          break;
        case 500:
          message =
              e.response?.data['message']?.isNotEmpty == true
                  ? e.response?.data['message']
                  : "Internal Server Error: Try again later";
          break;
        default:
          message =
              e.response?.data['message']?.isNotEmpty == true
                  ? e.response?.data['message']
                  : "Error: ${e.response?.statusCode}";
          break;
      }
    } else {
      message = "No Response Found";
    }

    //? Show error message using snackbar
    TextStyle typo12PrimaryTextRegular = AppTypography.typo12PrimaryTextRegular
        .copyWith(color: Colors.white);

    main.scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(message, style: typo12PrimaryTextRegular),
        backgroundColor: AppColors.error,
        margin: EdgeInsets.only(bottom: 40, left: 20, right: 20),
      ),
    );
  }
}

class ResponseModel {
  final int statusCode;
  final dynamic response;

  ResponseModel({required this.statusCode, required this.response});
}
