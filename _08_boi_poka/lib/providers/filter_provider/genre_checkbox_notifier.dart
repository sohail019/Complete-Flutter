import 'package:_08_boi_poka/providers/filter_provider/genre_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GenreCheckBoxNotifier extends StateNotifier<Map<int, bool>> {
  Ref ref;
  GenreCheckBoxNotifier(this.ref) : super({});

  // Toggle Checkbox Selection
  void toggleCheckbox(int index, bool isSelected, String genre) {
    if (isSelected) {
      ref.read(selectedGenreListProvider.notifier).addGenre(genre);
    } else {
      ref.read(selectedGenreListProvider.notifier).removeGenre(genre);
    }
    state = {...state, index: isSelected}; // Update state with new selection
  }

  // Get Checkbox Selection State
  bool isSelected(int index) {
    return state[index] ?? false;
  }

  void reset() {
    state = {};
  }
}

// Define Provider
final genreCheckboxProvider =
    StateNotifierProvider<GenreCheckBoxNotifier, Map<int, bool>>((ref) {
      return GenreCheckBoxNotifier(ref);
    });
