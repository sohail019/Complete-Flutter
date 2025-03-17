import 'package:_08_boi_poka/providers/filter_provider/author_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthorCheckBoxNotifier extends StateNotifier<Map<int, bool>> {
  Ref ref;
  AuthorCheckBoxNotifier(this.ref) : super({});

  // Toggle Checkbox Selection
  void toggleCheckbox(int index, bool isSelected, String genre) {
    if (isSelected) {
      ref.read(selectedAuthorListProvider.notifier).addAuthor(genre);
    } else {
      ref.read(selectedAuthorListProvider.notifier).removeAuthor(genre);
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
final authorCheckboxProvider =
    StateNotifierProvider<AuthorCheckBoxNotifier, Map<int, bool>>((ref) {
      return AuthorCheckBoxNotifier(ref);
    });
