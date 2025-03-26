import 'package:_08_boi_poka/models/get_all_books_model.dart';
import 'package:_08_boi_poka/providers/audio_books_provider/audio_books_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class AudioPagingNotifier
    extends StateNotifier<PagingController<int, BookData>> {
  Ref ref;

  AudioPagingNotifier(this.ref)
    : super(
        PagingController<int, BookData>(
          firstPageKey: ref.read(audioBooksStateProvider(null)).page,
        ),
      ) {
    state.addPageRequestListener((pageKey) {
      ref.read(audioBooksStateProvider(null).notifier).fetchBooks();
    });
  }

  void refreshController() {
    ref.read(audioBooksStateProvider(null)).page = 1;
    state.refresh();
  }

  void _addListener() {
    state.addPageRequestListener((pageKey) {
      ref.read(audioBooksStateProvider(null).notifier).fetchBooks();
    });
  }

  // 🔹 Reset everything on logout
  void resetPaging() {
    ref.read(audioBooksStateProvider(null)).page = 1;
    state.dispose();
    state = PagingController<int, BookData>(
      firstPageKey: ref.read(audioBooksStateProvider(null)).page,
    );
    _addListener();
  }
}

final audioPagingControllerProvider =
    StateNotifierProvider<AudioPagingNotifier, PagingController<int, BookData>>(
      (ref) {
        return AudioPagingNotifier(ref);
      },
    );
