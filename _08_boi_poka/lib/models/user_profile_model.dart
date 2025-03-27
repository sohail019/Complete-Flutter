class UserProfileModel {
  final String message;
  final User user;

  UserProfileModel({required this.message, required this.user});

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      message: json['message'],
      user: User.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'message': message, 'data': user.toJson()};
  }
}

class User {
  final String id;
  final String fullName;
  final String email;
  final String mobileNumber;
  final String userType;
  final String role;
  final List<String> genre;
  final List<String> friends;
  final String innerCircle;
  final List<String> invites;
  final DateTime createdAt;
  final bool isActive;
  final bool isVerified;
  final bool isDeleted;
  final Interests interests;
  final List<NotificationDetail> notificationDetails;
  final bool onBoarded;
  final List<String> favourites;
  final String profileImage;
  final dynamic socialProvider;
  final int totalBooks;
  final int completedBooks;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.mobileNumber,
    required this.userType,
    required this.role,
    required this.genre,
    required this.friends,
    required this.innerCircle,
    required this.invites,
    required this.createdAt,
    required this.isActive,
    required this.isVerified,
    required this.isDeleted,
    required this.interests,
    required this.notificationDetails,
    required this.onBoarded,
    required this.favourites,
    required this.profileImage,
    required this.socialProvider,
    required this.totalBooks,
    required this.completedBooks,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      fullName: json['fullName'],
      email: json['email'],
      mobileNumber: json['mobileNumber'],
      userType: json['userType'],
      role: json['role'],
      genre: List<String>.from(json['genre']),
      friends: List<String>.from(json['friends']),
      innerCircle: json['innerCircle'],
      invites: List<String>.from(json['invites']),
      createdAt: DateTime.parse(json['createdAt']),
      isActive: json['isActive'],
      isVerified: json['isVerified'],
      isDeleted: json['isDeleted'],
      interests: Interests.fromJson(json['interests']),
      notificationDetails:
          (json['notificationDetails'] as List)
              .map((e) => NotificationDetail.fromJson(e))
              .toList(),
      onBoarded: json['onBoarded'],
      favourites: List<String>.from(json['favourites']),
      profileImage: json['profileImage'],
      socialProvider: json['socialProvider'],
      totalBooks: json['totalBooks'],
      completedBooks: json['completedBooks'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'fullName': fullName,
      'email': email,
      'mobileNumber': mobileNumber,
      'userType': userType,
      'role': role,
      'genre': genre,
      'friends': friends,
      'innerCircle': innerCircle,
      'invites': invites,
      'createdAt': createdAt.toIso8601String(),
      'isActive': isActive,
      'isVerified': isVerified,
      'isDeleted': isDeleted,
      'interests': interests.toJson(),
      'notificationDetails':
          notificationDetails.map((e) => e.toJson()).toList(),
      'onBoarded': onBoarded,
      'favourites': favourites,
      'profileImage': profileImage,
      'socialProvider': socialProvider,
      'totalBooks': totalBooks,
      'completedBooks': completedBooks,
    };
  }
}

class Interests {
  final int? physical;
  final int? ebook;
  final int? audioBook;

  Interests({
    required this.physical,
    required this.ebook,
    required this.audioBook,
  });

  factory Interests.fromJson(Map<String, dynamic> json) {
    return Interests(
      physical: int.parse(
        double.parse(json['physical'].toString()).floor().toString(),
      ),
      ebook: int.parse(
        double.parse(json['ebook'].toString()).floor().toString(),
      ),
      audioBook: int.parse(
        double.parse(json['audioBook'].toString()).floor().toString(),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {'physical': physical, 'ebook': ebook, 'audioBook': audioBook};
  }
}

class NotificationDetail {
  final String? id;
  final String? deviceId;
  final String? deviceType;
  final String? notificationToken;

  NotificationDetail({
    this.id,
    this.deviceId,
    this.deviceType,
    this.notificationToken,
  });

  factory NotificationDetail.fromJson(Map<String, dynamic> json) {
    return NotificationDetail(
      id: json['_id'],
      deviceId: json['deviceId'],
      deviceType: json['deviceType'],
      notificationToken: json['notificationToken'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'deviceId': deviceId,
      'deviceType': deviceType,
      'notificationToken': notificationToken,
    };
  }
}
