import 'dart:developer';
import 'package:_08_boi_poka/models/genre_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getAllGenreProvider =
    AutoDisposeFutureProviderFamily<GenresResponse, String>((
      ref,
      libraryId,
    ) async {
      // Static genre data
      final staticGenres = [
        Genre(id: 1, name: 'Romance'),
        Genre(id: 2, name: 'Crime & Thriller'),
        Genre(id: 3, name: 'Fantasy'),
        Genre(id: 4, name: 'Mystery'),
        Genre(id: 5, name: 'Science Fiction'),
        Genre(id: 6, name: 'Horror'),
        Genre(id: 7, name: 'Literary Fiction'),
        Genre(id: 8, name: 'Drama'),
        Genre(id: 9, name: 'Young Adult'),
        Genre(id: 10, name: 'Biographies'),
        Genre(id: 11, name: 'Self Help'),
        Genre(id: 12, name: 'Cook Books'),
        Genre(id: 13, name: 'Travel Writing'),
        Genre(id: 14, name: 'True Crime'),
      ];

      // Return static genres as GenresResponse
      return GenresResponse(genres: staticGenres);
    });

class GenreProvider extends StateNotifier<List<String>?> {
  Ref ref;
  GenreProvider(this.ref) : super(null);

  void addGenre(String genre) {
    state = [...state ?? [], genre];
    log("Adding - $state");
  }

  void removeGenre(String genre) {
    state?.removeWhere((element) => element == genre);
    log("Removing - $state");
  }

  void reset() {
    state = [];
  }
}

final selectedGenreListProvider =
    StateNotifierProvider<GenreProvider, List<String>?>(
      (ref) => GenreProvider(ref),
    );
