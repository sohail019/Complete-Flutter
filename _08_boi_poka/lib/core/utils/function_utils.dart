import 'dart:io';

import 'package:_08_boi_poka/controller/user_controller.dart';
import 'package:_08_boi_poka/core/services/datasources/shared_preference_impl.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<String> requestNotifPermiAndGetToken(
  FirebaseMessaging firebaseMessaging,
) async {
  String? notificationToken = "";
  if (Platform.isAndroid || Platform.isIOS) {
    try {
      await firebaseMessaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );

      if (Platform.isIOS) {
        String? apnsToken = await FirebaseMessaging.instance.getAPNSToken();
      }
      notificationToken = await firebaseMessaging.getToken();
    } catch (e) {
      print(e);
      notificationToken = "";
    }
  }
  if (notificationToken != null && notificationToken.isNotEmpty) {
    return notificationToken;
  }
  return "";
}

void getUserDataAndStore() {
  final userController = UserController();
  final sharedPrefController = SharedPrefController();
  userController.getProfileData().then((value) {
    sharedPrefController.storeData("name", value.user.fullName);
    sharedPrefController.storeData("profileUrl", value.user.profileImage);
    sharedPrefController.storeData(
      "createdAt",
      value.user.createdAt.toString(),
    );
    sharedPrefController.storeData("innerCircleId", value.user.innerCircle);
    sharedPrefController.storeData(
      "completedBooks",
      value.user.completedBooks.toString(),
    );
    // sharedPrefController.storeBool(
    //     "onBoarded", value.user.onBoarded);
    sharedPrefController.storeData(
      "totalBooks",
      value.user.totalBooks.toString(),
    );
    sharedPrefController.storeData("email", value.user.email.toString());
    sharedPrefController.storeData(
      "mobileNumber",
      value.user.mobileNumber.toString(),
    );
  });
}
