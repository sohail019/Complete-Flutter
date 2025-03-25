class GetAllLibraryModel {
  final String message;
  final List<Library> data;

  GetAllLibraryModel({required this.message, required this.data});

  factory GetAllLibraryModel.fromJson(Map<String, dynamic> json) {
    return GetAllLibraryModel(
        message: json['message'],
        data: (json['data'] as List).map((e) => Library.fromJson(e)).toList());
  }
}

class Library {
  final String id;
  final String userId;
  final String libraryId;
  final String libraryName;
  final List<Shelf> shelves;
  final int version;

  Library({
    required this.id,
    required this.userId,
    required this.libraryId,
    required this.libraryName,
    required this.shelves,
    required this.version,
  });

  factory Library.fromJson(Map<String, dynamic> json) {
    return Library(
      id: json['_id'],
      userId: json['userId'],
      libraryId: json['libraryId'],
      libraryName: json['libraryName'],
      shelves: (json['shelves'] as List).map((e) => Shelf.fromJson(e)).toList(),
      version: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'userId': userId,
      'libraryId': libraryId,
      'libraryName': libraryName,
      'shelves': shelves.map((e) => e.toJson()).toList(),
      '__v': version,
    };
  }
}

class Shelf {
  final String shelfId;
  final int shelfPosition;
  final String id;

  Shelf({
    required this.shelfId,
    required this.shelfPosition,
    required this.id,
  });

  factory Shelf.fromJson(Map<String, dynamic> json) {
    return Shelf(
      shelfId: json['shelfId'],
      shelfPosition: json['shelfPosition'],
      id: json['_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'shelfId': shelfId,
      'shelfPosition': shelfPosition,
      '_id': id,
    };
  }
}

class LibrariesResponse {
  final String message;
  final List<Library> data;

  LibrariesResponse({required this.message, required this.data});

  factory LibrariesResponse.fromJson(Map<String, dynamic> json) {
    return LibrariesResponse(
      message: json['message'],
      data: (json['data'] as List).map((e) => Library.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}
