import 'package:_08_boi_poka/controller/books_controller.dart';
import 'package:_08_boi_poka/models/get_book_analytics_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookAnalyticsProvider =
    AutoDisposeFutureProviderFamily<GetBookAnalyticsModel, String>((
      ref,
      bookId,
    ) {
      final controller = BooksController();
      return controller.getBookAnalytics(bookId: bookId);
    });
