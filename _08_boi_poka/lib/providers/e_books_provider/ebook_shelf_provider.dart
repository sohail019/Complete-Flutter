import 'package:_08_boi_poka/providers/e_books_provider/ebooks_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class EbookShelfProvider
    extends StateNotifier<PagingController<int, Map<String, dynamic>>> {
  Ref ref;

  EbookShelfProvider(this.ref)
    : super(
        PagingController<int, Map<String, dynamic>>(
          firstPageKey: ref.read(ebookStateProvider(null)).page,
        ),
      ) {
    state.addPageRequestListener((pageKey) {
      ref.read(ebookStateProvider(null).notifier).fetchBooks();
    });
  }

  void refreshController() {
    ref.read(ebookStateProvider(null)).page = 1;
    state.refresh();
  }

  void _addListener() {
    state.addPageRequestListener((pageKey) {
      ref.read(ebookStateProvider(null).notifier).fetchBooks();
    });
  }

  // 🔹 Reset everything on logout
  void resetPaging() {
    ref.read(ebookStateProvider(null)).page = 1;

    state.dispose();
    state = PagingController<int, Map<String, dynamic>>(
      firstPageKey: ref.read(ebookStateProvider(null)).page,
    );
    _addListener();
  }
}

final ebookShelfPagingProvider = StateNotifierProvider<
  EbookShelfProvider,
  PagingController<int, Map<String, dynamic>>
>((ref) {
  return EbookShelfProvider(ref);
});
