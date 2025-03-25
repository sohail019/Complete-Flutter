import 'package:_08_boi_poka/components/views/books_grid_view.dart';
import 'package:_08_boi_poka/models/get_all_books_model.dart';
import 'package:flutter/material.dart';

class PhysicalBooksGridViewScreen extends StatelessWidget {
  final List<BookData> bookData;
  const PhysicalBooksGridViewScreen({required this.bookData, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BooksGridView(books: bookData));
  }
}
