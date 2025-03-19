import 'package:_08_boi_poka/components/views/books_grid_view.dart';
import 'package:_08_boi_poka/data/ebook_data.dart';
import 'package:flutter/material.dart';

class EBooksGridViewScreen extends StatelessWidget {
  const EBooksGridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BooksGridView(books: eBooksGridAndListData));
  }
}
