import 'package:_08_boi_poka/components/views/books_list_view.dart';
import 'package:_08_boi_poka/models/get_all_books_model.dart';
import 'package:flutter/material.dart';

class EBooksListViewScreen extends StatelessWidget {
  final List<BookData> eBooksData;
  const EBooksListViewScreen({super.key, required this.eBooksData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BooksListView(books: eBooksData));
  }
}
