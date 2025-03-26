import 'package:_08_boi_poka/components/views/books_list_view.dart';
import 'package:_08_boi_poka/models/get_all_books_model.dart';
import 'package:flutter/material.dart';

class AllBooksListViewScreen extends StatelessWidget {
  final List<BookData> allBooks;
  const AllBooksListViewScreen({super.key, required this.allBooks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BooksListView(books: allBooks));
  }
}
