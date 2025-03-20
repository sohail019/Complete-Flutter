import 'package:_08_boi_poka/core/services/datasources/auth_remote_datasource.dart';
import 'package:_08_boi_poka/core/services/datasources/shared_preference_impl.dart';
import 'package:_08_boi_poka/core/utils/api_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthRemoteController {
  final AuthRemoteDatasource _authRemoteDatasource = AuthRemoteDatasource();

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
    // storeAuthData(mapData, ref, false);
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

    return data;
  }

  Future<void> storeAuthData(
    ResponseModel mapData,
    WidgetRef ref,
    bool isLogin,
  ) async {
    sharedPref.storeBool("isLogin", true);

    await sharedPref.storeBool(
      "onBoarded",
      mapData.response["data"]["onBoarded"],
    );
  }
}
