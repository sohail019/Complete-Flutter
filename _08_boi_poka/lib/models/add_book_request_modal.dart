// Model class for Source
class BookSource {
  String sourceName;
  String sourceType;

  BookSource({required this.sourceName, required this.sourceType});

  // Factory constructor for creating a Source instance from JSON
  factory BookSource.fromJson(Map<String, dynamic> json) {
    return BookSource(
      sourceName: json['sourceName'],
      sourceType: json['sourceType'],
    );
  }

  // Convert a Source instance to a JSON object
  Map<String, dynamic> toJson() {
    return {'sourceName': sourceName, 'sourceType': sourceType};
  }
}

// Model class for the AddBookData
class AddBookData {
  String bookId;
  int readProgress;
  String status;
  String libraryName;
  List<int> location;
  BookSource source;
  String color;
  String textColor;

  AddBookData({
    required this.bookId,
    required this.readProgress,
    required this.status,
    required this.libraryName,
    required this.location,
    required this.source,
    required this.color,
    required this.textColor,
  });

  // Factory constructor for creating a AddBookData instance from JSON
  factory AddBookData.fromJson(Map<String, dynamic> json) {
    return AddBookData(
      bookId: json['bookId'],
      readProgress: json['readProgress'],
      status: json['status'],
      libraryName: json['libraryName'],
      location: List<int>.from(json['location']),
      source: BookSource.fromJson(json['source']),
      color: json['color'],
      textColor: json['textColor'],
    );
  }

  // Convert a AddBookData instance to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'bookId': bookId,
      'readProgress': readProgress,
      'status': status,
      'libraryName': libraryName,
      'location': location,
      'source': source.toJson(),
      'color': color,
      'textColor': textColor,
    };
  }
}

// Model class for the AddBook API request payload
class AddBookRequest {
  List<AddBookData> books;

  AddBookRequest({required this.books});

  // Factory constructor for creating an AddBookRequest instance from JSON
  factory AddBookRequest.fromJson(Map<String, dynamic> json) {
    return AddBookRequest(
      books: List<AddBookData>.from(json['books'].map((x) => AddBookData.fromJson(x))),
    );
  }

  // Convert an AddBookRequest instance to a JSON object
  Map<String, dynamic> toJson() {
    return {'books': List<dynamic>.from(books.map((x) => x.toJson()))};
  }
}
