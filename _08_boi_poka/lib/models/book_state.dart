class BooksState {
  final List<Book> books;
  final bool hasMore;
  dynamic page;

  BooksState({required this.books, required this.hasMore, required this.page});

  BooksState copyWith({List<Book>? books, bool? hasMore, int? page}) {
    return BooksState(
      books: books ?? this.books,
      hasMore: hasMore ?? this.hasMore,
      page: page ?? this.page,
    );
  }
}

class Book {
  final int id;
  final String title;
  final String author;

  Book({required this.id, required this.title, required this.author});
}
