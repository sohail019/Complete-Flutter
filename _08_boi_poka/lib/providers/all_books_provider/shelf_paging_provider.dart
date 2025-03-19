import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ShelfPagingProvider
    extends StateNotifier<AsyncValue<List<Map<String, dynamic>>?>> {
  ShelfPagingProvider() : super(const AsyncValue.loading()) {
    _fetchBooks(1);
  }

  static const int _itemsPerPage = 5;

  // Static dummy books
  static final List<Map<String, dynamic>> _dummyBooks = List.generate(20, (
    index,
  ) {
    return {
      "pageKey": (index ~/ _itemsPerPage) + 1,
      "data": List.generate(
        5,
        (i) => {
          "bookDetails": {
            "title": "Book ${index * 5 + i}",
            "author": ["Author ${index * 5 + i}"],
            "bookHeight": 120.0 + (i * 5),
            "bookWidth": 80.0,
            "bookThickness": 10.0,
            "color": ["red", "green", "blue", "yellow", "purple"][i % 5],
          },
        },
      ),
      "showImage": index % 2 == 0,
      "position": 2,
      "image": "assets/sample_book.png",
      "width": 60.0,
      "height": 90.0,
    };
  });

  Future<void> _fetchBooks(int pageKey) async {
    state = const AsyncValue.loading();
    await Future.delayed(
      const Duration(milliseconds: 500),
    ); // Simulating network delay

    final int startIndex = (pageKey - 1) * _itemsPerPage;
    final int endIndex = startIndex + _itemsPerPage;
    final List<Map<String, dynamic>> newItems = _dummyBooks.sublist(
      startIndex,
      endIndex.clamp(0, _dummyBooks.length),
    );

    state = AsyncValue.data(newItems);
  }

  void refreshController() {
    _fetchBooks(1);
  }
}

final allShelfPagingProvider = StateNotifierProvider<
  ShelfPagingProvider,
  AsyncValue<List<Map<String, dynamic>>?>
>((ref) => ShelfPagingProvider());
