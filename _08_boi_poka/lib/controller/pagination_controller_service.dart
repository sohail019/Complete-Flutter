import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaginationControllerService {
  void resetPagingController(WidgetRef ref) {
    // final listGridPagingController = ref.read(
    //   listGridPagingControllerProvider.notifier,
    // );
    // final allShelfPagingController = ref.read(allShelfPagingProvider.notifier);

    // final physicalShelfController = ref.read(
    //   physicalShelfPagingProvider.notifier,
    // );
    // final physicalPagingController = ref.read(
    //   physicalPagingControllerProvider.notifier,
    // );

    // final ebookPagingController = ref.read(
    //   ebookPagingControllerProvider.notifier,
    // );
    // final ebookShelfController = ref.read(ebookShelfPagingProvider.notifier);

    // final audioPagingController = ref.read(
    //   audioPagingControllerProvider.notifier,
    // );
    // final audioShelfController = ref.read(audioShelfPagingProvider.notifier);

    // ref.invalidate(booksStateProvider);
    // ref.invalidate(audioBooksStateProvider);
    // ref.invalidate(physicalBooksStateProvider);
    // ref.invalidate(ebookStateProvider);

    // listGridPagingController.resetPaging();
    // allShelfPagingController.resetPaging();
    // physicalPagingController.resetPaging();
    // physicalShelfController.resetPaging();
    // ebookShelfController.resetPaging();
    // ebookPagingController.resetPaging();
    // audioShelfController.resetPaging();
    // audioPagingController.resetPaging();
  }

  // void resetLibraryControllers(WidgetRef ref) {
  //   final allLibrary = ref.read(libraryProvider);
  //   final firstLibrary = allLibrary.value?.first;
  //   final physicalLibrary = ref.read(selectedPhysicalLibrary.notifier);
  //   final audioLibrary = ref.read(selectedAudioLibrary.notifier);
  //   final ebookLibrary = ref.read(selectedEbookLibrary.notifier);

  //   physicalLibrary.state = firstLibrary?.libraryId;
  //   audioLibrary.state = firstLibrary?.libraryId;
  //   ebookLibrary.state = firstLibrary?.libraryId;
  // }
}
