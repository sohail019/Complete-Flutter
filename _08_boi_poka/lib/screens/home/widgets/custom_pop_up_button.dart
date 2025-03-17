import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:_08_boi_poka/models/book_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPopUpButton extends StatelessWidget {
  final WidgetRef ref;
  final StateNotifierProviderFamily<dynamic, BooksState, Map<String, dynamic>?>
  stateNotifierProvider;
  final StateProvider<String?>? libraryStateProvider;
  const CustomPopUpButton({
    required this.ref,
    required this.libraryStateProvider,
    required this.stateNotifierProvider,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> filterOptions = ["ascending", "descending", "recency"];
    return PopupMenuButton<String>(
      offset: Offset(140.w, 35.h),
      color: AppColors.secondaryColor,
      menuPadding: EdgeInsets.symmetric(vertical: 3.h),
      onSelected: (value) {
        String? selectedLibrary =
            libraryStateProvider == null
                ? null
                : ref.read(libraryStateProvider!);
        switch (value) {
          case "descending":
            ref
                .read(
                  stateNotifierProvider({
                    "sortType": "desc",
                    "sortBy": "title",
                    "libraryId": selectedLibrary,
                  }).notifier,
                )
                .fetchBooks(refresh: true);
          case "ascending":
            ref
                .read(
                  stateNotifierProvider({
                    "sortType": "asc",
                    "sortBy": "title",
                    "libraryId": selectedLibrary,
                  }).notifier,
                )
                .fetchBooks(refresh: true);
          case "recency":
            ref
                .read(
                  stateNotifierProvider({
                    "sortType": "desc",
                    "sortBy": "updatedAt",
                    "libraryId": selectedLibrary,
                  }).notifier,
                )
                .fetchBooks(refresh: true);
        }
      },
      itemBuilder:
          (BuildContext context) =>
              filterOptions
                  .map(
                    (e) => PopupMenuItem<String>(
                      // height: 30.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 3.h,
                      ),
                      value: e,
                      child: SizedBox(
                        width: 105.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 7.w,
                              height: 2.h,
                              color: AppColors.primaryColor,
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              e,
                              style: AppTypography.typo12PrimaryTextMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Image.asset(
          AppImages.moreVertical,
          height: 0.05.sw,
          width: 0.05.sw,
        ),
      ),
    );
  }
}
