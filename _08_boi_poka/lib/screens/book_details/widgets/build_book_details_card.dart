import 'package:_08_boi_poka/components/adaptive_button.dart';
import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:_08_boi_poka/constants/app_routes.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:_08_boi_poka/models/get_all_books_model.dart';
import 'package:_08_boi_poka/navigation/app_router.gr.dart';
import 'package:_08_boi_poka/providers/physical_books_provider/physical_indicator_provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future buildBookDetailCard({
  required int rowIndex,
  required int columnIndex,
  required BuildContext context,
  required List<BookData?> books,
  required WidgetRef ref,
  required String page,
  required int? imagePosition,
  // required StateNotifierProviderFamily<dynamic, BooksState, Map<String, dynamic>?> bookStateNotifier
}) async {
  List rowBooks = List.from(books);
  rowBooks.removeWhere((element) => element == null);
  PageController controller = PageController(initialPage: columnIndex);
  // PageController controller = PageController(
  //     initialPage: (imagePosition != null && imagePosition < columnIndex)
  //         ? columnIndex - 1
  //         : columnIndex);
  await showGeneralDialog(
    barrierDismissible: false,
    barrierColor: Colors.white.withValues(alpha: 0.9),
    context: context,
    transitionDuration: const Duration(milliseconds: 650),
    pageBuilder: (context, animation, secondaryAnimation) {
      return FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: Curves.easeInOut),
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.8, end: 1.0).animate(
            CurvedAnimation(parent: animation, curve: Curves.slowMiddle),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 500.h,
                width: 400.w,
                child: PageView(
                  onPageChanged: (value) {
                    columnIndex = value;
                    ref.read(physicalIndicatorProvider.notifier).state =
                        !ref.read(physicalIndicatorProvider.notifier).state;
                  },
                  controller: controller,
                  children: List.generate(rowBooks.length, (index) {
                    String? imageUrl = rowBooks[index]?.bookDetails?.coverImage;
                    BookData? book = rowBooks[index];
                    String authorName =
                        books[index]?.bookDetails?.author?.isNotEmpty == true
                            ? books[index]!.bookDetails!.author![0]
                            : "-";
                    return SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.9,
                      width: MediaQuery.sizeOf(context).width,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(50.0),
                          child: Card(
                            color: Colors.white,
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.75,
                              height: MediaQuery.of(context).size.height * 0.6,
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Image.asset(
                                      "lib/assets/images/cancel_icon.png",
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  (imageUrl != null && imageUrl.isNotEmpty)
                                      ? ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: CachedNetworkImage(
                                          imageUrl: imageUrl,
                                          fit: BoxFit.cover,
                                          height:
                                              MediaQuery.sizeOf(
                                                context,
                                              ).height *
                                              0.3,
                                        ),
                                      )
                                      : Image.asset(
                                        fit: BoxFit.cover,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                            0.3,
                                        AppImages.wormLogo,
                                      ),
                                  SizedBox(height: 20.h),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 40.w,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          book?.bookDetails?.title ??
                                              'Not Found',
                                          style:
                                              AppTypography
                                                  .title20PrimaryTextBold,
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                        SizedBox(height: 4.h),
                                        Text(
                                          authorName,
                                          style:
                                              AppTypography
                                                  .typo12Height12PrimaryTextRegular,
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                        SizedBox(height: 20.h),
                                        AdaptiveButtonWidget(
                                          disabled: false,
                                          onTap: () {
                                            Map<String, dynamic> bookDetails = {
                                              'title': book?.bookDetails?.title,
                                              // item.volumeInfo.title,
                                              'authors':
                                                  book?.bookDetails?.author,
                                              //  item.volumeInfo.authors,
                                              'description':
                                                  book
                                                      ?.bookDetails
                                                      ?.description,
                                              // item.volumeInfo.description,
                                              'thumbnail':
                                                  book?.bookDetails?.coverImage,
                                              //  imageUrl,
                                              'categories':
                                                  book?.bookDetails?.genre,
                                              //  item.volumeInfo.categories
                                              '_id': book?.bookDetails?.id,
                                              'row': book?.row,
                                              'column': book?.column,
                                              "libraryName": book?.libraryName,
                                              "tag":
                                                  "${book?.bookDetails?.id}-$page-shelf-$rowIndex$columnIndex",
                                            };
                                            Navigator.pop(context);
                                            context.router.push(
                                              PageRouteInfo(
                                                AppRoutes.bookDetails,
                                                args: BookDetailsRouteArgs(
                                                  bookDetails: bookDetails,
                                                  tag:
                                                      "${book?.bookDetails?.id}-$page-shelf-$rowIndex$columnIndex",
                                                ),
                                              ),
                                            );
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //     builder: (context) => BookDetailsScreen(
                                            //       bookDetails: bookDetails,
                                            //       tag:
                                            //           "${book?.bookDetails?.id}-all-shelf-$rowIndex$columnIndex",
                                            //     ),
                                            //   ),
                                            // );
                                          },
                                          title: "more",
                                          iconImg:
                                              "lib/assets/images/more_horizontal.png",
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              Consumer(
                builder: (context, ref, child) {
                  final updatedIndicator = ref.watch(physicalIndicatorProvider);
                  return Material(
                    child: Center(
                      child: Text(
                        "${columnIndex + 1} / ${rowBooks.length}",
                        style: AppTypography.typo16PrimaryTextBold,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
