import 'dart:developer';
import 'dart:io';

import 'package:_08_boi_poka/core/services/datasources/ocr_datasource.dart';
import 'package:_08_boi_poka/core/utils/api_utils.dart';
import 'package:_08_boi_poka/models/ocr_book_model.dart';
import 'package:flutter/material.dart';

class OcrController {
  // final chatGptController = ChatGptController();

  final OcrDatasource ocrDatasource = OcrDatasource();

  // Future<Map<String, dynamic>> getBookIsbn(String bookName) async {
  //   final Map<String, dynamic> data = await chatGptController.getChatResponse(
  //     "Book Name: $bookName,find the complete name and isbn number (without hypen) of the book and result name and isbn in json format or if not able to find, return empty fields",
  //   );
  //   // log("OCR Result - $data");
  //   return data;
  // }

  Future<OcrBookModel> getImageData(
    File imageFile,
    BuildContext context,
  ) async {
    ResponseModel data = await ocrDatasource.fetchImageData(imageFile, context);
    OcrBookModel ocrDataList = OcrBookModel.fromJson(data.response);
    log("getImageData - $ocrDataList");
    return ocrDataList;
  }
}
