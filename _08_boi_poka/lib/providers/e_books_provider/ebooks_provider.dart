import 'package:_08_boi_poka/controller/books_controller.dart';
import 'package:_08_boi_poka/models/book_state.dart';
import 'package:_08_boi_poka/providers/e_books_provider/ebook_paging_controller.dart';
import 'package:_08_boi_poka/providers/e_books_provider/ebook_shelf_provider.dart';
import 'package:_08_boi_poka/providers/friend_user_id_provider.dart/friend_user_id_provider.dart';
import 'package:_08_boi_poka/providers/library_provider/get_all_library_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:developer';

class EBooksNotifier extends StateNotifier<BooksState> {
  Ref ref;
  Map<String, dynamic>? data;
  EBooksNotifier(this.ref, this.data)
    : super(BooksState(books: [], hasMore: true, page: 1));

  final booksController = BooksController();
  // final ShelfUiComponentsController shelfUiComponentsController =
  //     ShelfUiComponentsController();

  Future<void> fetchBooks({bool refresh = false}) async {
    if (refresh) {
      state = BooksState(books: [], hasMore: true, page: 1);
      reset();
    }

    if (!state.hasMore) return;

    try {
      final friendUserId = ref.read(friendUserIdProvider);
      final libraryData = ref.read(libraryProvider);
      final libraryId = libraryData.value?[0].libraryId;
      // Fetch books from API (replace with your API call)
      final newBooks =
          (friendUserId != null && friendUserId.isNotEmpty)
              ? await booksController.getMemberAllBook(
                userId: friendUserId,
                pageNo: state.page.toString(),
                bookType: "eBook",
                sortType: data?['sortType'],
                genres: data?['genres'],
                libraryId: data?['libraryId'] ?? libraryId,
                authors: data?['authors'],
                sortBy: data?['sortBy'] ?? "createdAt",
                searchTitle: data?['searchTitle'],
              )
              : await booksController.getAllBooks(
                pageNo: state.page.toString(),
                bookType: "eBook",
                genres: data?['genres'],
                libraryId: data?['libraryId'] ?? libraryId,
                authors: data?['authors'],
                sortType: data?['sortType'],
                sortBy: data?['sortBy'] ?? "createdAt",
                searchTitle: data?['searchTitle'],
              );

      final isLastPage = newBooks.data!.length < 26;
      final nextPage = state.page + 1;

      if (isLastPage) {
        ref
            .read(ebookPagingControllerProvider)
            .appendLastPage(newBooks.data ?? []);
        // final value = mapShelfData(newBooks.data);
        // final cloneData = List<BookData?>.from(newBooks.data ?? []);
        // List<Map<String, dynamic>> value = shelfUiComponentsController
        //     .mapShelfData(
        //       booksData: cloneData,
        //       ref: ref,
        //       shelfPagingControllerProvider: ebookShelfPagingProvider,
        //     );
        // ref.read(ebookShelfPagingProvider).appendLastPage(value);
      } else {
        ref
            .read(ebookPagingControllerProvider)
            .appendPage(newBooks.data ?? [], nextPage);
        // final cloneData = List<BookData?>.from(newBooks.data ?? []);
        // List<Map<String, dynamic>> value = shelfUiComponentsController
        //     .mapShelfData(
        //       booksData: cloneData,
        //       ref: ref,
        //       shelfPagingControllerProvider: ebookShelfPagingProvider,
        //     );
        // // log("mapData - $value");
        // ref.read(ebookShelfPagingProvider).appendPage(value, nextPage);
      }
      state = state.copyWith(
        books: [...state.books, ...(newBooks.data as List<Book>? ?? [])],
        hasMore: newBooks.data?.isNotEmpty,
        page: state.page + 1,
      );
      // log("stateData - ${state.books.map((e) => e.toJson()).toList().length}");
    } on DioException catch (error) {
      log("Error Occured - $error");
      if (error.response?.statusCode == 404) {
        // pagingController.error = "No More Books";
        ref.read(ebookPagingControllerProvider).appendLastPage([]);
        ref.read(ebookShelfPagingProvider).appendLastPage([]);
        return;
      }
    } catch (e) {
      log("Error Occured - $e");
    }
  }

  void reset() {
    ref.read(ebookPagingControllerProvider).itemList = [];
    ref.read(ebookShelfPagingProvider).itemList = [];
  }
}

final selectedEbookLibrary = StateProvider<String?>((ref) => null);

final ebookStateProvider = StateNotifierProvider.family<
  EBooksNotifier,
  BooksState,
  Map<String, dynamic>?
>((ref, arg) {
  return EBooksNotifier(ref, arg);
});
