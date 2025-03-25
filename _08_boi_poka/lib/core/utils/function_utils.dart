import 'dart:io';

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
