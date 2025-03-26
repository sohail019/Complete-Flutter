import 'package:_08_boi_poka/models/get_all_books_model.dart';
import 'package:_08_boi_poka/providers/physical_books_provider/physical_books_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PhysicalPagingNotifier
    extends StateNotifier<PagingController<int, BookData>> {
  Ref ref;

  PhysicalPagingNotifier(this.ref)
    : super(PagingController<int, BookData>(firstPageKey: 1)) {
    state.addPageRequestListener((pageKey) {
      ref.read(physicalBooksStateProvider(null).notifier).fetchBooks();
    });
  }

  void refreshController() {
    ref.read(physicalBooksStateProvider(null)).page = 1;
    state.refresh();
  }

  void _addListener() {
    state.addPageRequestListener((pageKey) {
      ref.read(physicalBooksStateProvider(null).notifier).fetchBooks();
    });
  }

  // 🔹 Reset everything on logout
  void resetPaging() {
    ref.read(physicalBooksStateProvider(null)).page = 1;

    state.dispose();
    state = PagingController<int, BookData>(
      firstPageKey: ref.read(physicalBooksStateProvider(null)).page,
    );
    _addListener();
  }
}

final physicalPagingControllerProvider = StateNotifierProvider<
  PhysicalPagingNotifier,
  PagingController<int, BookData>
>((ref) {
  return PhysicalPagingNotifier(ref);
});
