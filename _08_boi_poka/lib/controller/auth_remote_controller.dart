import 'package:_08_boi_poka/controller/secure_storage_controller.dart';
import 'package:_08_boi_poka/core/services/datasources/auth_remote_datasource.dart';
import 'package:_08_boi_poka/core/services/datasources/shared_preference_impl.dart';
import 'package:_08_boi_poka/core/utils/api_utils.dart';
import 'package:_08_boi_poka/providers/library_provider/get_all_library_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthRemoteController {
  final AuthRemoteDatasource _authRemoteDatasource = AuthRemoteDatasource();
  final SecureStorageController _secureStorageController =
      SecureStorageController();
  final SharedPrefController sharedPref = SharedPrefController();

  Future<ResponseModel> register({
    required String fullName,
    required String email,
    required String phoneNum,
    required String password,
    required BuildContext context,
    required WidgetRef ref,
  }) async {
    ResponseModel mapData = await _authRemoteDatasource.register(
      fullName: fullName,
      email: email,
      phoneNum: phoneNum,
      password: password,
      context: context,
    );
    storeAuthData(mapData, ref, false);
    return mapData;
  }

  Future<ResponseModel> loginWithPhoneNumber({
    required String phoneNum,
    required String password,
    required BuildContext context,
    required WidgetRef ref,
  }) async {
    ResponseModel data = await _authRemoteDatasource.loginWithPhoneNumber(
      phoneNum: phoneNum,
      password: password,
      context: context,
    );
    await storeAuthData(data, ref, true);
    return data;
  }

  Future<ResponseModel> forgetPassword({
    required String phoneNum,
    required String type,
  }) async {
    ResponseModel data = await _authRemoteDatasource.forgetPassword(
      phoneNum: phoneNum,
      type: type,
    );
    return data;
  }

  Future<ResponseModel> verifyOtp({
    required String phoneNum,
    required String otp,
    required BuildContext context,
  }) async {
    ResponseModel data = await _authRemoteDatasource.verifyOtp(
      otp: otp,
      phoneNum: phoneNum,
      context: context,
    );
    return data;
  }

  Future<ResponseModel?> getNewToken({required String refreshToken}) async {
    return await _authRemoteDatasource.getNewToken(refreshToken: refreshToken);
  }

  Future<void> storeAuthData(
    ResponseModel mapData,
    WidgetRef ref,
    bool isLogin,
  ) async {
    sharedPref.storeBool("isLogin", true);
    await _secureStorageController.storeSecureData(
      key: "jwtToken",
      value: mapData.response["data"]["token"],
    );

    await _secureStorageController.storeSecureData(
      key: "refreshToken",
      value: mapData.response["data"]["refreshToken"],
    );

    await _secureStorageController.storeSecureData(
      key: "tokenExpiryDate",
      value: mapData.response["data"]["tokenExpiryDate"],
    );

    await sharedPref.storeBool(
      "onBoarded",
      mapData.response["data"]["onBoarded"],
    );

    await sharedPref.storeBool(
      "isVerified",
      mapData.response["data"]["isVerified"],
    );

    if (isLogin) {
      final library = ref.read(libraryProvider);
    }
  }
}
