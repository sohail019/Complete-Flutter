import 'dart:io';

class GoogleLoginModel {
  final String? uid;
  final String? displayName;
  final String? email;
  final String? photoUrl;
  final String? phoneNumber;
  final String? refreshToken;
  final String? deviceType;
  final String? deviceId;
  final String? notificationToken;

  GoogleLoginModel({
    this.uid,
    this.displayName,
    this.email,
    this.photoUrl,
    this.phoneNumber,
    this.refreshToken,
    this.deviceType,
    this.deviceId,
    this.notificationToken,
  });

  //? Factory method to create a model instance from Firebase user
  factory GoogleLoginModel.fromJson(Map<String, dynamic> data) {
    return GoogleLoginModel(
      uid: data['uid'] ?? "",
      displayName: data['displayName'] ?? "",
      email: data['email'] ?? "",
      photoUrl: data['photoUrl'] ?? "",
      phoneNumber: data['phoneNumber'] ?? "",
      deviceId: "Mac Address",
      deviceType: Platform.isAndroid ? "Android" : 'IOS',
      notificationToken: 'sample',
      refreshToken: 'sample',
    );
  }

  //? Convert model to JSON
  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "displayName": displayName,
      "email": email,
      "photoUrl": photoUrl,
      "phoneNumber": phoneNumber,
    };
  }
}
