import "dart:io";
import "package:_08_boi_poka/controller/secure_storage_controller.dart";
import "package:_08_boi_poka/controller/social_login_controller.dart";
import "package:_08_boi_poka/core/services/datasources/shared_preference_impl.dart";
import "package:_08_boi_poka/core/utils/api_utils.dart";
import "package:_08_boi_poka/core/utils/function_utils.dart";
import "package:_08_boi_poka/screens/home/home_screen.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_messaging/firebase_messaging.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:google_sign_in/google_sign_in.dart";
import "package:loader_overlay/loader_overlay.dart";

class GoogleLoginController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final socialController = SocialLoginController();
  final SecureStorageController _secureStorageController =
      SecureStorageController();

  Future<User?> signInWithGoogle(BuildContext context, WidgetRef ref) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return null;
      }
      context.loaderOverlay.show();

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
      );
      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );
      if (userCredential.user != null) {
        final userData = userCredential.user;
        String? phoneNum = userCredential.user?.phoneNumber;
        final sharedPref = SharedPrefController();
        userCredential.user!.updateDisplayName(googleUser.displayName);
        String? token = "";
        try {
          token = await requestNotifPermiAndGetToken(_firebaseMessaging);
        } catch (e) {
          print(e);
        }
        ResponseModel data = await socialController.loginWithGoogle(
          displayName: userData?.displayName ?? '',
          email: userData?.email ?? "",
          phoneNumber: userData?.phoneNumber ?? "",
          photoUrl: userData?.photoURL ?? "",
          refreshToken: "sample",
          uid: userData?.uid ?? "",
          deviceType: Platform.isAndroid ? "Android" : "IOS",
          deviceId: "99887744556662",
          notificationToken: token! ?? "",
        );
        if (data.statusCode == 200 || data.statusCode == 201) {
          bool onBoarded = data.response['data']['onBoarded'];
          if (onBoarded) {
            sharedPref.storeBool("onBoarded", onBoarded);
            sharedPref.storeBool("isLogin", true);
          }
          sharedPref.storeData("email", userCredential.user!.email!);

          await _secureStorageController.storeSecureData(
            key: "jwtToken",
            value: data.response['data']['token'],
          );
          await _secureStorageController.storeSecureData(
            key: "refreshToken",
            value: data.response['data']['refreshToken'],
          );
          await _secureStorageController.storeSecureData(
            key: "tokenExpiryDate",
            value: data.response['data']['tokenExpiryDate'],
          );
          if (onBoarded) {
            // final library = ref.read(libraryProvider);
            Future.microtask(() {
              context.loaderOverlay.hide();
            });
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
                // builder: (context) => AnalyticsScreen(),
              ),
            );
            // context.loaderOverlay.hide();
            // context.router.pushAndPopUntil(
            //   PageRouteInfo(AppRoutes.homeScreen),
            //   predicate: (route) => false,
            // );
          } else {
            context.loaderOverlay.hide();
            // customPhoneNumberDialogue(context, phoneNum);
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Login Failed",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
            ),
          );
        }
      } else {
        context.loaderOverlay.hide();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Login Failed",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
      return userCredential.user;
    } catch (e) {
      context.loaderOverlay.hide();
      print("GoogleAuthCrash");
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login Error", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.red,
        ),
      );
      return null;
    }
  }

  Future<void> googleSignOut() async {
    await _googleSignIn.signOut();
    // await _auth.signOut();
  }
}
