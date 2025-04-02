class OcrBookModel {
  final List<OcrBook>? data;

  OcrBookModel({required this.data});

  factory OcrBookModel.fromJson(Map<String, dynamic> json) {
    return OcrBookModel(
      data: (json['data'] as List).map((e) => OcrBook.fromJson(e)).toList(),
    );
  }
}

class OcrBook {
  final String? message;
  final BookData? data;
  final bool found;
  bool isChecked = false;

  OcrBook({
    this.message,
    this.data,
    required this.found,
    this.isChecked = false,
  });

  factory OcrBook.fromJson(Map<String, dynamic> json) {
    var data =
        json['message'] == "Book not found"
            ? null
            : BookData.fromJson(json['data']);

    if (json['message'] == "Book not found" &&
        json['title'].toString().isNotEmpty) {
      try {
        data = BookData.fromNotFoundJson(
          json['title'],
          json['author'] != null ? List<String>.from(json['author']) : null,
        );
      } catch (e) {
        data = null;
      }
    }

    return OcrBook(
      message: json['message'],
      data: data,
      found: json['found'],
      isChecked: false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data,
      'message': message,
      'found': found,
      'isChecked': isChecked,
    };
  }
}

class BookData {
  final String? id;
  final List<String>? isbn;
  final String? title;
  final List<dynamic>? author;
  final int? publicationYear;
  final List<String>? genre;
  final String? description;
  final String? coverImage;
  final List<String>? language;
  final List<String>? authorOrigin;
  final double? rating;
  final bool? isIndian;
  final DateTime? addedAt;
  final DateTime? updatedAt;

  BookData({
    this.id,
    this.isbn,
    this.title,
    this.author,
    this.publicationYear,
    this.genre,
    this.description,
    this.coverImage,
    this.language,
    this.authorOrigin,
    this.rating,
    this.isIndian,
    this.addedAt,
    this.updatedAt,
  });

  factory BookData.fromJson(Map<String, dynamic> json) {
    return BookData(
      id: json['_id'],
      isbn: json['ISBN'] != null ? List<String>.from(json['ISBN']) : null,
      title: json['title'],
      author: json['author'],
      publicationYear: json['publicationYear'],
      genre: json['genre'] != null ? List<String>.from(json['genre']) : null,
      description: json['description'],
      coverImage: json['coverImage'],
      language:
          json['language'] != null ? List<String>.from(json['language']) : null,
      authorOrigin:
          json['authorOrigin'] != null
              ? List<String>.from(json['authorOrigin'])
              : null,
      rating:
          json['rating'] != null ? (json['rating'] as num).toDouble() : null,
      isIndian: json['isIndian'],
      addedAt: json['addedAt'] != null ? DateTime.parse(json['addedAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  factory BookData.fromNotFoundJson(String title, List<dynamic>? authors) {
    return BookData(title: title, author: authors);
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'ISBN': isbn,
      'title': title,
      'author': author,
      'publicationYear': publicationYear,
      'genre': genre,
      'description': description,
      'coverImage': coverImage,
      'language': language,
      'authorOrigin': authorOrigin,
      'rating': rating,
      'isIndian': isIndian,
      'addedAt': addedAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
