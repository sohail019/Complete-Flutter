import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:_08_boi_poka/models/book_state.dart';
import 'package:_08_boi_poka/screens/home/widgets/custom_pop_up_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFilterHeaderWidget extends StatelessWidget {
  final WidgetRef ref;
  final StateNotifierProviderFamily<dynamic, BooksState, Map<String, dynamic>?>
  stateNotifierProvider;
  final StateProvider<String?>? libraryStateProvider;
  final Function() onFilterTap;

  const CustomFilterHeaderWidget({
    super.key,
    this.libraryStateProvider,
    required this.ref,
    required this.stateNotifierProvider,
    required this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    final iconSize = 0.05.sw;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomPopUpButton(
          libraryStateProvider: libraryStateProvider,
          ref: ref,
          stateNotifierProvider: stateNotifierProvider,
        ),
        SizedBox(width: 12.w),
        InkWell(
          onTap: onFilterTap,
          child: Image.asset(
            AppImages.filter,
            height: iconSize,
            fit: BoxFit.cover,
            width: iconSize,
          ),
        ),
        SizedBox(width: 8.w),
      ],
    );
  }
}
