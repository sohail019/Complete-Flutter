import 'package:_08_boi_poka/controller/books_controller.dart';
import 'package:_08_boi_poka/models/similar_books_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final getSelectedBooksDetailsProvider =
//     FutureProvider.autoDispose<Map<String, dynamic>>((ref) async {
//       final shelfController = ShelfController();
//       final response = await shelfController.checkIsbnLocally(
//         ref.read(isbnProvider.notifier).state,
//         ref.read(titleProvider.notifier).state,
//         ref.read(authorsProvider.notifier).state,
//       );
//       // ref.watch(showLoadingProvider.notifier).state = false;
//       return response;
//     });

final booksByAuthorProvider =
    FutureProvider.family<List<SimilarBooksModel>, String>((ref, arg) async {
      final booksController = BooksController();
      List<SimilarBooksModel> data = await booksController.getBooksByAuthor(
        bookId: arg,
      );
      return data;
    });

final similarBooksProvider =
    FutureProvider.family<List<SimilarBooksModel>, String>((ref, arg) async {
      final booksController = BooksController();
      return booksController.getSimilarBooks(bookId: arg);
    });

final isbnProvider = StateProvider<String>((ref) => '');
final authorsProvider = StateProvider<List<String>>((ref) => []);
final titleProvider = StateProvider<String>((ref) => '');
