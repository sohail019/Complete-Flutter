import 'package:_08_boi_poka/models/book_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLibraryDropdown extends StatelessWidget {
  final WidgetRef ref;
  final StateNotifierProviderFamily<dynamic, BooksState, Map<String, dynamic>?>
  stateNotifierProvider;
  final StateProvider<String?> selectedLibrary;

  const CustomLibraryDropdown({
    super.key,
    required this.ref,
    required this.stateNotifierProvider,
    required this.selectedLibrary,
  });

  @override
  Widget build(BuildContext context) {
    // final getAllLibrary = ref.watch(libraryProvider);
    // final data = getAllLibrary.value;
    return SizedBox(height: 30.h, width: 110.w);
  }
}
