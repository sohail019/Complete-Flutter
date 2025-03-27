class SimilarBooksModel {
  final String title;
  final List<String> author;
  final List<String> isbn;
  final int publicationYear;
  final String description;
  final List<String> genre;
  final String coverImage;
  final List<String> language;
  final double rating;
  final String color;
  final double bookHeight;
  final double bookThickness;
  final String bookId;

  SimilarBooksModel(
      {required this.title,
      required this.author,
      required this.isbn,
      required this.publicationYear,
      required this.description,
      required this.genre,
      required this.coverImage,
      required this.language,
      required this.rating,
      required this.color,
      required this.bookHeight,
      required this.bookThickness,
      required this.bookId});

  // Factory constructor to create a Book from a JSON map
  factory SimilarBooksModel.fromJson(Map<String, dynamic> json) {
    return SimilarBooksModel(
        title: json['title'],
        author: List<String>.from(json['author']),
        isbn: List<String>.from(json['ISBN']),
        publicationYear: json['publicationYear'],
        description: json['description'],
        genre: List<String>.from(json['genre']),
        coverImage: json['coverImage'],
        language: List<String>.from(json['language']),
        rating: (json['rating'] as num).toDouble(),
        color: json['color'],
        bookHeight: (json['bookHeight'] as num).toDouble(),
        bookThickness: (json['bookThickness'] as num).toDouble(),
        bookId: json['bookId']);
  }

  // Method to convert a Book to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'author': author,
      'ISBN': isbn,
      'publicationYear': publicationYear,
      'description': description,
      'genre': genre,
      'coverImage': coverImage,
      'language': language,
      'rating': rating,
      'color': color,
      'bookHeight': bookHeight,
      'bookThickness': bookThickness,
    };
  }

  // Helper method to create a list of books from JSON
  static List<SimilarBooksModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => SimilarBooksModel.fromJson(json)).toList();
  }
}
