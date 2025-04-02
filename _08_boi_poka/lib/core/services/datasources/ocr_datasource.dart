import 'dart:developer';
import 'dart:io';
import 'package:_08_boi_poka/core/utils/api_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class OcrDatasource {
  final ApiUtils apiUtils = ApiUtils();

  Future<ResponseModel> fetchImageData(
    File imageFile,
    BuildContext context,
  ) async {
    String fileName = imageFile.path.split('/').last;
    ResponseModel data = await apiUtils.postApi(
      baseUrl: apiUtils.dio.options.baseUrl,
      endPoint: "/api/book/ocr-book-list",
      formData: FormData.fromMap({
        "image": await MultipartFile.fromFile(
          imageFile.path,
          filename: fileName,
        ),
      }),
    );
    log("Fetching Image Data : $data");
    return data;
  }
}
