import 'package:_08_boi_poka/components/views/books_shelf_view.dart';
import 'package:_08_boi_poka/data/ebook_data.dart';
import 'package:flutter/material.dart';

class EBooksShelfScreen extends StatelessWidget {
  const EBooksShelfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BooksShelfView(bookShelves: eBooksShelfData));
  }
}
