import 'package:_08_boi_poka/models/get_all_books_model.dart';
import 'package:_08_boi_poka/providers/e_books_provider/ebooks_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class EBookPagingControllerNotifier
    extends StateNotifier<PagingController<int, BookData>> {
  Ref ref;

  EBookPagingControllerNotifier(this.ref)
    : super(
        PagingController<int, BookData>(
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
    state = PagingController<int, BookData>(
      firstPageKey: ref.read(ebookStateProvider(null)).page,
    );
    _addListener();
  }
}

final ebookPagingControllerProvider = StateNotifierProvider<
  EBookPagingControllerNotifier,
  PagingController<int, BookData>
>((ref) {
  return EBookPagingControllerNotifier(ref);
});
