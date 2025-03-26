import 'package:_08_boi_poka/components/views/books_grid_view.dart';
import 'package:_08_boi_poka/models/get_all_books_model.dart';
import 'package:flutter/material.dart';

class AllBooksGridViewScreen extends StatelessWidget {
  final List<BookData> allBooksData;
  const AllBooksGridViewScreen({super.key, required this.allBooksData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BooksGridView(books: allBooksData));
  }
}
