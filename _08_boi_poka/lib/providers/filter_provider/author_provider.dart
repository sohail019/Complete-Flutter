import 'dart:developer';
import 'package:_08_boi_poka/models/author_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getAllAuthorProvider =
    AutoDisposeFutureProviderFamily<AuthorsResponse, String>((
      ref,
      libraryId,
    ) async {
      // Static author data
      final staticAuthors = [
        Author(id: 1, name: 'Author 1'),
        Author(id: 2, name: 'Author 2'),
        Author(id: 3, name: 'Author 3'),
        Author(id: 4, name: 'Author 4'),
        Author(id: 5, name: 'Author 5'),
        Author(id: 6, name: 'Author 6'),
        Author(id: 7, name: 'Author 7'),
        Author(id: 8, name: 'Author 8'),
        Author(id: 9, name: 'Author 9'),
        Author(id: 10, name: 'Author 10'),
      ];

      // Return static authors as AuthorsResponse
      return AuthorsResponse(authors: staticAuthors);
    });

class AuthorProvider extends StateNotifier<List<String>?> {
  AuthorProvider() : super(null);

  void addAuthor(String author) {
    state = [...state ?? [], author];
    log("Adding - $state");
  }

  void removeAuthor(String author) {
    state?.removeWhere((element) => element == author);
    log("Removing - $state");
  }

  void reset() {
    state = [];
  }
}

final selectedAuthorListProvider =
    StateNotifierProvider<AuthorProvider, List<String>?>(
      (ref) => AuthorProvider(),
    );
