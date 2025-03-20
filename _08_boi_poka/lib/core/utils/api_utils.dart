import "dart:developer";
import "dart:io";

import "package:dio/dio.dart";
import "package:flutter_dotenv/flutter_dotenv.dart";

class ApiUtils {
  final Dio dio = Dio(
    BaseOptions(
      connectTimeout: Duration(seconds: 300),
      baseUrl: dotenv.env['BaseURL']!,
    ),
  );

  // ApiUtils() {
  //   dio.interceptors.add(
  //     InterceptorsWrapper(
  //       onRequest:
  //           (
  //             RequestOptions options,
  //             RequestInterceptorHandler handler,
  //           ) async {},
  //     ),
  //   );
  // }

  //? Method to make a get request to the API
  Future<ResponseModel> getApi({
    required String baseUrl,
    required String endPoint,
    Object? data,
  }) async {
    try {
      // String? token = await _storage.getSecureData(key: "jwtToken");

      final Uri uri = Uri.parse("$baseUrl$endPoint");
      final Response response = await dio.getUri(uri, data: data);
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
      // String? token = await _storage.getSecureData
      // baseUrl = baseUrl ?? dotenv.env["BaseURL"]!;
      final Uri uri = Uri.parse("$baseUrl$endPoint");
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
}

class ResponseModel {
  final int statusCode;
  final dynamic response;

  ResponseModel({required this.statusCode, required this.response});
}
