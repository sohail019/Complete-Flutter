import 'package:_08_boi_poka/components/views/books_list_view.dart';
import 'package:_08_boi_poka/data/physical_books_data.dart';
import 'package:flutter/material.dart';

class PhysicalBooksListViewScreen extends StatelessWidget {
  const PhysicalBooksListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BooksListView(books: physicalBooksGridAndListData));
  }
}
