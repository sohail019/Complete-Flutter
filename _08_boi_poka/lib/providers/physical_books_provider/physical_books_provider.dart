import 'package:_08_boi_poka/models/book_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PhysicalBooksNotifier extends StateNotifier<BooksState> {
  Ref ref;
  Map<String, dynamic>? data;
  bool _isLoading = false;

  PhysicalBooksNotifier(this.ref, this.data)
    : super(BooksState(books: [], hasMore: true, page: 1)) {}

  bool isLastPageAdded = false;

  void _loadBooks() {
    // Static book data
    final staticBooks = [
      Book(id: 1, title: 'Book 1', author: 'Author 1'),
      Book(id: 2, title: 'Book 2', author: 'Author 2'),
      Book(id: 3, title: 'Book 3', author: 'Author 3'),
      Book(id: 4, title: 'Book 4', author: 'Author 4'),
      Book(id: 5, title: 'Book 5', author: 'Author 5'),
      Book(id: 6, title: 'Book 6', author: 'Author 6'),
      Book(id: 7, title: 'Book 7', author: 'Author 7'),
      Book(id: 8, title: 'Book 8', author: 'Author 8'),
      Book(id: 9, title: 'Book 9', author: 'Author 9'),
      Book(id: 10, title: 'Book 10', author: 'Author 10'),
    ];

    // Update the state with static books
    state = state.copyWith(books: staticBooks, hasMore: false, page: 1);
  }
}

final physicalBooksStateProvider = StateNotifierProvider.family<
  PhysicalBooksNotifier,
  BooksState,
  Map<String, dynamic>?
>((ref, args) {
  return PhysicalBooksNotifier(ref, args);
});
