import 'package:_08_boi_poka/components/views/books_shelf_view.dart';
import 'package:_08_boi_poka/data/dummy_books.dart';
import 'package:flutter/material.dart';

class AudioBooksShelfScreen extends StatelessWidget {
  const AudioBooksShelfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BooksShelfView(bookShelves: dummyBooks));
  }
}
