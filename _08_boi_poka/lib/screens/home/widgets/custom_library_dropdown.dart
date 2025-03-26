import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:_08_boi_poka/models/book_state.dart';
import 'package:_08_boi_poka/providers/filter_provider/author_provider.dart';
import 'package:_08_boi_poka/providers/filter_provider/authors_checkbox_notifier.dart';
import 'package:_08_boi_poka/providers/filter_provider/genre_checkbox_notifier.dart';
import 'package:_08_boi_poka/providers/filter_provider/genre_provider.dart';
import 'package:_08_boi_poka/providers/library_provider/get_all_library_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class CustomLibraryDropdown extends StatelessWidget {
  final WidgetRef ref;
  final StateNotifierProviderFamily<dynamic, BooksState, Map<String, dynamic>?>
  stateNotifierProvider;
  final StateProvider<String?> selectedLibrary;
  final Function(String libraryId)? getBookData;

  const CustomLibraryDropdown({
    super.key,
    required this.ref,
    required this.stateNotifierProvider,
    required this.selectedLibrary,
    required this.getBookData,
  });

  @override
  Widget build(BuildContext context) {
    final getAllLibrary = ref.watch(libraryProvider);
    final data = getAllLibrary.value ?? [];
    return SizedBox(
      height: 30.h,
      width: 110.w,
      child: Consumer(
        builder: (context, consumerRef, child) {
          final selectedLib = ref.watch(selectedLibrary);

          final isValidValue = data.any(
            (library) => library.libraryId == selectedLib,
          );

          return DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              dropdownStyleData: DropdownStyleData(
                offset: const Offset(5, -15),
                maxHeight: 200.h,
              ),
              style: AppTypography.title24PrimaryTextRegular,
              value: isValidValue ? selectedLib : null,
              hint: Text(
                (data.isNotEmpty ? data[0].libraryName : "Select Library") ??
                    "Select Library",
                style: TextStyle(fontSize: 14.sp),
              ),
              isExpanded: true,
              menuItemStyleData: MenuItemStyleData(height: 26.h),
              items:
                  data.map<DropdownMenuItem<String>>((library) {
                    return DropdownMenuItem(
                      alignment: AlignmentDirectional.topCenter,
                      value: library.libraryId,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              library.libraryName,
                              style:
                                  AppTypography
                                      .typo12Height12PrimaryTextRegular,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),

              //? Custom display for the selected item
              selectedItemBuilder: (BuildContext context) {
                return data.map<Widget>((library) {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      library.libraryName,
                      style: AppTypography.title14PrimaryTextRegular,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      maxLines: 1,
                    ),
                  );
                }).toList();
              },

              onChanged: (value) {
                if (value != null) {
                  getBookData!(value);
                  ref.read(genreCheckboxProvider.notifier).reset();
                  ref.read(authorCheckboxProvider.notifier).reset();
                  ref.read(selectedGenreListProvider.notifier).reset();
                  ref.read(selectedAuthorListProvider.notifier).reset();
                  ref.read(selectedLibrary.notifier).state = value;

                  ref
                      .read(
                        stateNotifierProvider({"libraryId": value}).notifier,
                      )
                      .fetchBooks(refresh: true);
                }
              },
            ),
          );
        },
      ),
    );
  }
}
