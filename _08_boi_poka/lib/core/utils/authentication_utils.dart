import 'package:_08_boi_poka/main.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class FingerprintUtils {
  final LocalAuthentication localAuth = LocalAuthentication();

  Future<bool> isBiometricsAvailable() async {
    final bool isBiometricsAvail = await localAuth.canCheckBiometrics;
    return isBiometricsAvail;
  }

  Future<bool> authWithBiometrics() async {
    if (await isBiometricsAvailable()) {
      return localAuth.authenticate(
        localizedReason: "Authenticate to login",
        options: AuthenticationOptions(biometricOnly: true),
      );
    } else {
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(content: Text("Biometric is not supported")),
      );
      return false;
    }
  }

  Future<bool> authWithPattern() async {
    if (await isBiometricsAvailable()) {
      return localAuth.authenticate(
        localizedReason: "Authenticate to login",
        options: AuthenticationOptions(biometricOnly: false, stickyAuth: true),
      );
    } else {
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(content: Text("Device does not support Authentication")),
      );
      return false;
    }
  }
}
