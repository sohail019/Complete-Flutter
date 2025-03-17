import 'package:_08_boi_poka/components/common_back_bar.dart';
import 'package:_08_boi_poka/components/custom_checkbox_widget.dart';
import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:_08_boi_poka/models/book_state.dart';
import 'package:_08_boi_poka/models/genre_model.dart';
import 'package:_08_boi_poka/models/get_all_books_model.dart';
import 'package:_08_boi_poka/providers/filter_provider/author_provider.dart';
import 'package:_08_boi_poka/providers/filter_provider/authors_checkbox_notifier.dart';
import 'package:_08_boi_poka/providers/filter_provider/genre_checkbox_notifier.dart';
import 'package:_08_boi_poka/providers/filter_provider/genre_provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:skeletonizer/skeletonizer.dart';

@RoutePage()
class FilterPage extends ConsumerStatefulWidget {
  final StateNotifierProviderFamily<dynamic, BooksState, Map<String, dynamic>?>
  stateNotifierProvider;
  final StateProvider<bool> pageFilterToggleProvider;
  final StateNotifierProvider<dynamic, PagingController<int, BookData>>?
  listGridControllerProvider;
  final StateNotifierProvider<
    dynamic,
    PagingController<int, Map<String, dynamic>>
  >?
  shelfControllerProvider;

  final String libraryId;

  const FilterPage({
    super.key,
    required this.libraryId,
    required this.stateNotifierProvider,
    required this.pageFilterToggleProvider,
    this.listGridControllerProvider,
    this.shelfControllerProvider,
  });

  @override
  FilterPageState createState() => FilterPageState();
}

class FilterPageState extends ConsumerState<FilterPage> {
  final TextEditingController searchBarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final selectedGenreList = ref.watch(selectedGenreListProvider);
    final selectedAuthorList = ref.watch(selectedAuthorListProvider);

    final isTablet =
        View.of(context).physicalSize.shortestSide /
            View.of(context).devicePixelRatio >=
        680;
    // var orientation = MediaQuery.of(context).orientation;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar:
          isTablet
              ? PreferredSize(
                preferredSize: Size.fromHeight(screenHeight * 0.1),
                child: CommonBackBar(title: 'filter'),
              )
              : CommonBackBar(title: 'filter'),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.06,
          vertical: screenHeight * 0.03,
        ),
        child: ListView(
          children: [
            //? Search bar for searching books will do later
            SizedBox(height: 24.h),
            Text("by genre", style: AppTypography.title18PrimaryTextRegular),
            const Divider(),
            Consumer(
              builder: (context, ref, child) {
                final genreData = ref.watch(
                  getAllGenreProvider(widget.libraryId),
                );
                return genreData.when(
                  data: (data) {
                    GenresResponse genreData = data;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: genreData.genres.length,
                          itemBuilder: (context, index) {
                            final title = genreData.genres[index].name;

                            return Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 2.h),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        title,
                                        style:
                                            AppTypography
                                                .typo12PrimaryTextRegular,
                                      ),
                                      Spacer(),
                                      Consumer(
                                        builder: (context, ref, child) {
                                          final checkboxState = ref.watch(
                                            genreCheckboxProvider,
                                          );
                                          final checkboxNotifier = ref.read(
                                            genreCheckboxProvider.notifier,
                                          );
                                          return CustomCheckboxWidget(
                                            value:
                                                checkboxState[index] ?? false,
                                            onChanged: (bool? value) {
                                              checkboxNotifier.toggleCheckbox(
                                                index,
                                                value ?? false,
                                                genreData.genres[index].name,
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(),
                              ],
                            );
                          },
                        ),
                      ],
                    );
                  },
                  error: (error, stackTrace) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: Text("no genre found"),
                    );
                  },
                  loading: () => shimmerLoading(),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 10.0,
        elevation: 8,
        height: 60.h,
        color: AppColors.secondaryColor,
        padding: EdgeInsets.all(0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 0.5,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    // blurRadius: 3,
                    color: AppColors.trackBackgroundColor,
                    offset: Offset(0, -1),
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    ref.read(selectedGenreListProvider.notifier).reset();
                    ref.read(genreCheckboxProvider.notifier).reset();
                    ref.read(authorCheckboxProvider.notifier).reset();
                    ref.read(selectedAuthorListProvider.notifier).reset();

                    ref.read(widget.pageFilterToggleProvider.notifier).state =
                        !ref
                            .read(widget.pageFilterToggleProvider.notifier)
                            .state;
                    if (widget.listGridControllerProvider != null) {
                      ref
                          .read(widget.listGridControllerProvider!.notifier)
                          .refreshController();
                    }
                    if (widget.shelfControllerProvider != null) {
                      ref
                          .read(widget.shelfControllerProvider!.notifier)
                          .refreshController();
                    }
                    Navigator.pop(context);
                  },
                  child: Container(
                    color: AppColors.secondaryColor,
                    width: 0.5.sw,
                    height: screenHeight * 0.08,
                    child: Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        "reset filter",
                        style: AppTypography.typo16PrimaryTextBold,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap:
                      ((selectedGenreList?.isEmpty ?? true) &&
                              (selectedAuthorList?.isEmpty ?? true) &&
                              searchBarController.text.trim().isEmpty)
                          ? null
                          : () async {
                            ref
                                .read(
                                  widget.stateNotifierProvider({
                                    "searchTitle":
                                        searchBarController.text
                                                .trim()
                                                .isNotEmpty
                                            ? searchBarController.text.trim()
                                            : null,
                                    "genres": selectedGenreList,
                                    "authors": selectedAuthorList,
                                    "libraryId": widget.libraryId,
                                  }).notifier,
                                )
                                .fetchBooks(refresh: true);
                            ref
                                .read(widget.pageFilterToggleProvider.notifier)
                                .state = !ref
                                    .read(
                                      widget.pageFilterToggleProvider.notifier,
                                    )
                                    .state;
                            // ref.read(selectedGenreListProvider.notifier).reset();
                            // ref.read(selectedAuthorListProvider.notifier).reset();
                            Navigator.pop(context);
                          },
                  child: Consumer(
                    builder: (context, ref, child) {
                      final genreCheckboxNotifier = ref.watch(
                        genreCheckboxProvider,
                      );
                      final authorChecckboxNotifier = ref.watch(
                        authorCheckboxProvider,
                      );

                      final isButtonDisabled =
                          genreCheckboxNotifier.values.every((v) => !v) &&
                          authorChecckboxNotifier.values.every((v) => !v) &&
                          searchBarController.text.trim().isEmpty;

                      return Opacity(
                        opacity: isButtonDisabled ? 0.6 : 1.0,
                        child: Container(
                          color: AppColors.greyColor,
                          width: 0.5.sw,
                          height: screenHeight * 0.08,
                          child: Center(
                            child: Text(
                              "apply filter",
                              style: AppTypography.typo16PrimaryTextBold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget shimmerLoading() {
  return Skeletonizer(
    child: ListView.builder(
      itemBuilder: (context, index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Sample Shimmer Text",
              style: AppTypography.typo12PrimaryTextRegular,
            ),
            CustomCheckboxWidget(value: false, onChanged: (bool? value) {}),
          ],
        );
      },
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: 5,
    ),
  );
}
