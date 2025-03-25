class GetAllBooksModel {
  String? message;
  List<BookData>? data;
  int? currentPage;
  int? totalBooks;

  GetAllBooksModel({
    this.message,
    this.data,
    this.currentPage,
    this.totalBooks,
  });

  factory GetAllBooksModel.fromJson(Map<String, dynamic> json) =>
      GetAllBooksModel(
        message: json['message'],
        data:
            (json['data'] as List<dynamic>?)
                ?.map((item) => BookData.fromJson(item))
                .toList(),
        currentPage: json['currentPage'],
        totalBooks: json['totalBooks'],
      );

  Map<String, dynamic> toJson() => {
    'message': message,
    'data': data?.map((item) => item.toJson()).toList(),
    'currentPage': currentPage,
    'totalBooks': totalBooks,
  };
}

class BookData {
  String? bookId;
  int? readProgress;
  String? color;
  String? status;
  List<Source>? source;
  BookDetails? bookDetails;
  List<int>? position;
  String? shelfId;
  int? row;
  int? column;
  String? updatedAt;
  String? addedAt;
  String? libraryName;
  int? libraryIndex;
  // BookColorScheme? colorScheme;

  BookData({
    this.bookId,
    this.readProgress,
    this.color,
    this.status,
    this.source,
    this.bookDetails,
    this.position,
    this.shelfId,
    this.row,
    this.column,
    this.updatedAt,
    this.addedAt,
    this.libraryName,
    this.libraryIndex,
    // this.colorScheme
  });

  factory BookData.fromJson(Map<String, dynamic> json) => BookData(
    bookId: json['bookId'],
    readProgress: json['readProgress'],
    color: json['color'],
    status: json['status'],
    source:
        (json['source'] as List<dynamic>?)
            ?.map((item) => Source.fromJson(item))
            .toList(),
    bookDetails:
        json['bookDetails'] != null
            ? BookDetails.fromJson(json['bookDetails'])
            : null,
    position:
        (json['position'] as List<dynamic>?)?.map((e) => e as int).toList(),
    shelfId: json['shelfId'],
    updatedAt: json['updatedAt'],
    column: json['column'],
    row: json['row'],
    addedAt: json['addedAt'],
    libraryName: json['libraryName'],
    libraryIndex: json['libraryIndex'],
    // colorScheme: json['colorScheme'] != null ? BookColorScheme.fromJson(json['colorScheme'])
    // : null,

    // row: json['row'],
    // column: json['column'],
  );

  Map<String, dynamic> toJson() => {
    'bookId': bookId,
    'readProgress': readProgress,
    'color': color,
    'status': status,
    'source': source?.map((item) => item.toJson()).toList(),
    'bookDetails': bookDetails?.toJson(),
    'position': position,
    'shelfId': shelfId,
    'row': row,
    'column': column,
    'libraryName': libraryName,
    "addedAt": addedAt,
    // "colorScheme": colorScheme?.toJson()
  };
}

class Source {
  String? sourceName;
  String? sourceType;
  String? id;

  Source({this.sourceName, this.sourceType, this.id});

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    sourceName: json['sourceName'],
    sourceType: json['sourceType'],
    id: json['_id'],
  );

  Map<String, dynamic> toJson() => {
    'sourceName': sourceName,
    'sourceType': sourceType,
    '_id': id,
  };
}

class BookDetails {
  String? id;
  List<String>? isbn;
  String? title;
  List<String>? author;
  int? publicationYear;
  List<String>? genre;
  String? description;
  String? coverImage;
  List<String>? language;
  double? rating;
  bool? isIndian;
  bool? isDeleted;
  String? addedAt;
  String? updatedAt;
  int? v;
  List<String>? authorOrigin;
  String? color;
  double? bookHeight;
  double? bookThickness;
  double? bookWidth;
  BookColorScheme? bookColorScheme;

  BookDetails({
    this.id,
    this.isbn,
    this.title,
    this.author,
    this.publicationYear,
    this.genre,
    this.description,
    this.coverImage,
    this.language,
    this.rating,
    this.isIndian,
    this.isDeleted,
    this.addedAt,
    this.updatedAt,
    this.v,
    this.authorOrigin,
    this.color,
    this.bookHeight,
    this.bookThickness,
    this.bookWidth,
    this.bookColorScheme,
  });

  factory BookDetails.fromJson(Map<String, dynamic> json) {
    final height = json['bookHeight'] ?? 0.0;
    final bookThickness = json['bookThickness'] ?? 0.0;
    final width = json['bookWidth'] ?? 0.0;
    return BookDetails(
      id: json['_id'],
      isbn: (json['ISBN'] as List<dynamic>?)?.map((e) => e as String).toList(),
      title: json['title'],
      author:
          (json['author'] as List<dynamic>?)?.map((e) => e as String).toList(),
      publicationYear: json['publicationYear'],
      genre:
          (json['genre'] as List<dynamic>?)?.map((e) => e as String).toList(),
      description: json['description'],
      coverImage: json['coverImage'],
      language:
          (json['language'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      rating: (json['rating'] as num?)?.toDouble(),
      isIndian: json['isIndian'],
      isDeleted: json['isDeleted'],
      addedAt: json['addedAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
      authorOrigin:
          (json['authorOrigin'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      color: json['color'],
      bookHeight: double.parse(height.toString()),
      bookThickness: double.parse(bookThickness.toString()),
      bookWidth: double.parse(width.toString()),
      bookColorScheme:
          json['bookColorScheme'] != null
              ? BookColorScheme.fromJson(json['bookColorScheme'])
              : null,
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': id,
    'ISBN': isbn,
    'title': title,
    'author': author,
    'publicationYear': publicationYear,
    'genre': genre,
    'description': description,
    'coverImage': coverImage,
    'language': language,
    'rating': rating,
    'isIndian': isIndian,
    'isDeleted': isDeleted,
    'addedAt': addedAt,
    'updatedAt': updatedAt,
    '__v': v,
    'authorOrigin': authorOrigin,
    'color': color,
    'bookHeight': bookHeight,
    'bookThickness': bookThickness,
    'bookWidth': bookWidth,
    "bookColorScheme": bookColorScheme?.toJson(),
  };
}

class BookColorScheme {
  final String startColor;
  final String middleColor;
  final String endColor;
  final String textColor;

  const BookColorScheme({
    required this.startColor,
    required this.middleColor,
    required this.endColor,
    required this.textColor,
  });

  // Default BookColorScheme
  static const BookColorScheme defaultScheme = BookColorScheme(
    startColor: "#323131",
    middleColor: "#777777",
    endColor: "#0D0D0D",
    textColor: "#FFFFFF",
  );

  factory BookColorScheme.fromJson(Map<String, dynamic> json) {
    return BookColorScheme(
      startColor: json['startColor'],
      middleColor: json['middleColor'],
      endColor: json['endColor'],
      textColor: json['textColor'],
    );
  }

  Map<String, dynamic> toJson() => {
    'startColor': startColor,
    'middleColor': middleColor,
    'endColor': endColor,
    'textColor': textColor,
  };
}
