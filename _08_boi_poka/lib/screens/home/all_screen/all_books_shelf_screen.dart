import 'package:_08_boi_poka/components/views/books_shelf_view.dart';
import 'package:_08_boi_poka/data/all_books_data.dart';
import 'package:flutter/material.dart';

class AllBooksShelfScreen extends StatelessWidget {
  const AllBooksShelfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BooksShelfView(bookShelves: allBooksShelfData));
  }
}
