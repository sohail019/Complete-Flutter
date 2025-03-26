import 'dart:async';
import 'dart:developer';

import 'package:_08_boi_poka/controller/books_controller.dart';
import 'package:_08_boi_poka/core/services/datasources/shared_preference_impl.dart';
import 'package:_08_boi_poka/models/get_all_library_model.dart';
import 'package:_08_boi_poka/providers/friend_user_id_provider.dart/friend_user_id_provider.dart';
import 'package:_08_boi_poka/providers/physical_books_provider/physical_books_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LibraryNotifier extends AsyncNotifier<List<Library>> {
  final libraryController = BooksController();

  @override
  FutureOr<List<Library>> build() async {
    final friendUserId = ref.read(friendUserIdProvider);
    GetAllLibraryModel data =
        (friendUserId != null && friendUserId.isNotEmpty)
            ? await libraryController.getAllMemberLibrary(userId: friendUserId)
            : await libraryController.getAllLibraries();
    log("Library Data - ${data.data}");
    ref.read(selectedPhysicalLibrary.notifier).state = data.data[0].libraryId;
    // ref.read(selectedAudioLibrary.notifier).state = data.data[0].libraryId;
    // ref.read(selectedEbookLibrary.notifier).state = data.data[0].libraryId;
    return data.data;
  }

  Future<void> resetLibrary() async {
    GetAllLibraryModel data = await libraryController.getAllLibraries();
    log("Library Data - ${data.data}");
    ref.read(selectedPhysicalLibrary.notifier).state = data.data[0].libraryId;
    // ref.read(selectedAudioLibrary.notifier).state = data.data[0].libraryId;
    // ref.read(selectedEbookLibrary.notifier).state = data.data[0].libraryId;
    state = AsyncData(data.data);
  }

  Future<void> refreshLibrary() async {
    final sharedPref = SharedPrefController();
    final onBoarded = await sharedPref.getBool("onBoarded");
    if (onBoarded == true) {
      final friendUserId = ref.read(friendUserIdProvider);
      state = AsyncLoading();
      final data =
          (friendUserId != null && friendUserId.isNotEmpty)
              ? await libraryController.getAllMemberLibrary(
                userId: friendUserId,
              )
              : await libraryController.getAllLibraries();
      state = AsyncData(data.data);
    }
  }
}

final libraryProvider = AsyncNotifierProvider<LibraryNotifier, List<Library>>(
  LibraryNotifier.new,
);

final getAllLibraryProvider = FutureProvider.autoDispose((ref) {
  final booksController = BooksController();
  return booksController.getAllLibraries();
});
