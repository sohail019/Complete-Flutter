import 'package:_08_boi_poka/components/views/books_grid_view.dart';
import 'package:_08_boi_poka/models/get_all_books_model.dart';
import 'package:flutter/material.dart';

class AudioBooksGridViewScreen extends StatelessWidget {
  final List<BookData> audioBooksData;
  const AudioBooksGridViewScreen({super.key, required this.audioBooksData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BooksGridView(books: audioBooksData));
  }
}
