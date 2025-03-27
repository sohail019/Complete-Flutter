import 'package:_08_boi_poka/components/common_back_bar.dart';
import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:_08_boi_poka/models/get_book_analytics_model.dart';
import 'package:_08_boi_poka/providers/book_details_provider/book_analytics_provider.dart';
import 'package:_08_boi_poka/providers/book_details_provider/book_details_provider.dart';
import 'package:_08_boi_poka/providers/home_screen_provider/home_screen_notifier.dart';
import 'package:_08_boi_poka/screens/book_details/widgets/book_info.dart';
import 'package:_08_boi_poka/screens/book_details/widgets/book_item.dart';
import 'package:_08_boi_poka/screens/book_details/widgets/book_shelf_stats.dart';
import 'package:_08_boi_poka/screens/book_details/widgets/data_analysis_accordion.dart';
import 'package:_08_boi_poka/screens/book_details/widgets/fan_fiction.dart';
import 'package:_08_boi_poka/screens/book_details/widgets/reviews.dart';
import 'package:_08_boi_poka/screens/book_details/widgets/shelf.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

@RoutePage()
class BookDetailsScreen extends ConsumerStatefulWidget {
  final Map<String, dynamic>? bookDetails;
  final String? tag;
  const BookDetailsScreen({super.key, this.bookDetails, this.tag});

  @override
  ConsumerState<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends ConsumerState<BookDetailsScreen> {
  GetBookAnalyticsModel? analyticsData;
  bool isAnalyticsApiExecuting = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> fetchAnalyticsData() async {
    final bookId = widget.bookDetails?['_id'];
    if (bookId != null) {
      try {
        final data = await ref.read(bookAnalyticsProvider(bookId).future);
        // if (data.statusCode == 200) {
        isAnalyticsApiExecuting = false;
        setState(() {
          analyticsData = data;
        });
      } catch (e) {
        debugPrint('Error fetching analytics data: $e');
        isAnalyticsApiExecuting = false;
      }
    }
  }

  Widget _buildShimmer({required double width, required double height}) {
    print(widget.bookDetails);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6.r),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bookDetails = widget.bookDetails;

    // Handle the case where authors and categories may be a String or a List<String>
    List<String> authors = [];
    if (bookDetails?['authors'] is String) {
      authors =
          (bookDetails?['authors'] as String)
              .split(',')
              .map((e) => e.trim())
              .toList();
    } else if (bookDetails?['authors'] is List<String>) {
      authors = List<String>.from(bookDetails?['authors']);
    }

    List<String> categories = [];
    if (bookDetails?['categories'] is String) {
      categories =
          (bookDetails?['categories'] as String)
              .split(',')
              .map((e) => e.trim())
              .toList();
    } else if (bookDetails?['categories'] is List<String>) {
      categories = List<String>.from(bookDetails?['categories']);
    }
    String? imageUrl = bookDetails?['thumbnail'];
    String title = bookDetails?['title'];
    // List<String> author = bookDetails?['authors'];
    // List<String> categories = bookDetails?['categories'] ?? [];
    int row = bookDetails?['row'] ?? 0;
    int column = bookDetails?['column'] ?? 0;
    String? libraryName = bookDetails?['libraryName'] ?? "";

    int selectedIndex = ref.watch(selectedIndexHomeProvider);

    final isTablet =
        View.of(context).physicalSize.shortestSide /
            View.of(context).devicePixelRatio >=
        680;
    // var orientation = MediaQuery.of(context).orientation;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    // final isPortrait = orientation == Orientation.portrait;

    final sectionGap = isTablet ? 44.h : 44.h;

    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar:
          isTablet
              ? PreferredSize(
                preferredSize: Size.fromHeight(screenHeight * 0.1),
                child: CommonBackBar(title: libraryName!),
                // page: 'book-details'
              )
              : CommonBackBar(title: libraryName!),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.025),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    (imageUrl != null && imageUrl.isNotEmpty)
                        ? Image.network(
                          imageUrl,
                          width: 257.w,
                          height: 300.h,
                          fit: BoxFit.fill,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                width: 257.w,
                                height: 300.h,
                                color: Colors.white,
                              ),
                            );
                          },
                          errorBuilder:
                              (context, error, stackTrace) => SizedBox(
                                width: 257.w,
                                height: 300.h,
                                child: Image.asset(
                                  AppImages.wormLogo,
                                  fit: BoxFit.cover,
                                ),
                              ),
                        )
                        : SizedBox(
                          width: 257.w,
                          height: 300.h,
                          child: Image.asset(
                            AppImages.wormLogo,
                            fit: BoxFit.cover,
                          ),
                        ),
                    SizedBox(width: screenWidth * 0.05),
                    (row == 0 && column == 0)
                        ? Container(
                          width: 257.w,
                          height: 300.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Text(
                            'Not on shelf',
                            style: AppTypography.typo12PrimaryTextRegular,
                          ),
                        )
                        : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BookShelfStats(
                              title: 'shelf',
                              count: row,
                              imagePath: AppImages.bookRow,
                            ),
                            SizedBox(height: 16.h),
                            BookShelfStats(
                              title: 'from left',
                              count: column,
                              imagePath: AppImages.bookColumn,
                            ),
                          ],
                        ),
                  ],
                ),
              ),
              SizedBox(height: sectionGap),
              BookInfo(bookDetails: bookDetails ?? {}),
              SizedBox(height: sectionGap),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Data Analysis',
                      style: AppTypography.title24PrimaryTextRegular,
                    ),
                    SizedBox(height: 14.h),
                    Consumer(
                      builder: (context, ref, child) {
                        final bookId = bookDetails?['_id'];
                        final analyticsData = ref.watch(
                          bookAnalyticsProvider(bookId!),
                        );

                        return analyticsData.when(
                          data: (data) {
                            return Padding(
                              padding: EdgeInsets.only(
                                left: screenWidth * 0.05,
                              ),
                              child: DataAnalysisAccordion(analyticsData: data),
                            );
                          },
                          loading:
                              () => _buildShimmer(
                                width: screenWidth,
                                height: 300.h,
                              ),
                          error: (error, stackTrace) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Text(
                                'No data Found',
                                style: AppTypography.typo12PrimaryTextRegular,
                              ),
                            );
                          },
                        );
                      },
                    ),

                    // isAnalyticsApiExecuting
                    //     ? _buildShimmer(width: screenWidth, height: 300.h)
                    //     : analyticsData == null
                    //     ? Text(
                    //       'No data Found',
                    //       style: AppTypography.typo12PrimaryTextRegular,
                    //     )
                    //     : Padding(
                    //       padding: EdgeInsets.only(left: screenWidth * 0.05),
                    //       child: DataAnalysisAccordion(
                    //         analyticsData: analyticsData!,
                    //       ),
                    //     ),
                  ],
                ),
              ),
              SizedBox(height: sectionGap),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  'Reviews',
                  style: AppTypography.title24PrimaryTextRegular,
                ),
              ),
              SizedBox(height: 26.h),
              Consumer(
                builder: (context, ref, child) {
                  final bookId = bookDetails?['_id'];
                  final analyticsData = ref.watch(
                    bookAnalyticsProvider(bookId!),
                  );

                  return analyticsData.when(
                    data: (data) {
                      return Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.05),
                        child: Reviews(analyticsData: data),
                      );
                    },
                    loading:
                        () => _buildShimmer(width: screenWidth, height: 300.h),
                    error: (error, stackTrace) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(
                          'No reviews Found',
                          style: AppTypography.typo12PrimaryTextRegular,
                        ),
                      );
                    },
                  );
                },
              ),
              SizedBox(height: sectionGap),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  'Fan Fiction',
                  style: AppTypography.title24PrimaryTextRegular,
                ),
              ),
              SizedBox(height: 22.h),
              Consumer(
                builder: (context, ref, child) {
                  final bookId = bookDetails?['_id'];
                  final analyticsData = ref.watch(
                    bookAnalyticsProvider(bookId!),
                  );

                  return analyticsData.when(
                    data: (data) {
                      return Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.05),
                        child: FanFictionA(analyticsData: data),
                      );
                    },
                    loading:
                        () => _buildShimmer(width: screenWidth, height: 300.h),
                    error: (error, stackTrace) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(
                          'No data Found',
                          style: AppTypography.typo12PrimaryTextRegular,
                        ),
                      );
                    },
                  );
                },
              ),
              SizedBox(height: sectionGap),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  "In the series but \nnot on your shelf yet",
                  style: AppTypography.title24PrimaryTextRegular,
                ),
              ),
              SizedBox(height: 22.h),
              Consumer(
                builder: (context, ref, child) {
                  final getSimilarBook = ref.watch(
                    similarBooksProvider(bookDetails?['_id']),
                  );
                  return getSimilarBook.when(
                    data: (data) {
                      return SizedBox(
                        height: 0.2.sh,
                        width: MediaQuery.sizeOf(context).width,
                        child: Shelf(
                          items: [
                            ...List.generate(data.length, (index) {
                              return GestureDetector(
                                onTap: () {
                                  Map<String, dynamic> detailsData = {
                                    'title': data[index].title,
                                    // data[index].volumeInfo.title,
                                    'authors': data[index].author,
                                    //  data[index].volumeInfo.authors,
                                    'description': data[index].description,
                                    // data[index].volumeInfo.description,
                                    'thumbnail': data[index].coverImage,
                                    //  imageUrl,
                                    'categories': data[index].genre,
                                    '_id': data[index].bookId,
                                  };
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => BookDetailsScreen(
                                            bookDetails: detailsData,
                                          ),
                                    ),
                                  );
                                },
                                child: BookItem(
                                  imagePath: data[index].coverImage,
                                ),
                              );
                            }),
                          ],
                        ),
                      );
                    },
                    error:
                        (error, stackTrace) => SizedBox(
                          height: screenHeight * 0.2,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Text(
                              "No Books Found",
                              style: AppTypography.typo12PrimaryTextRegular,
                            ),
                          ),
                        ),
                    loading:
                        () => Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.primaryColor,
                            ),
                          ),
                        ),
                  );
                },
              ),
              SizedBox(height: sectionGap),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  "Other bestsellers \nby the same author",
                  style: AppTypography.title24PrimaryTextRegular,
                ),
              ),
              SizedBox(height: 22.h),
              Consumer(
                builder: (context, ref, child) {
                  final booksByAuthor = ref.watch(
                    booksByAuthorProvider(bookDetails?['_id']),
                  );
                  return booksByAuthor.when(
                    data: (data) {
                      return SizedBox(
                        height: 0.2.sh,
                        width: MediaQuery.sizeOf(context).width,
                        child: Shelf(
                          items: List.generate(data.length, (index) {
                            return GestureDetector(
                              onTap: () {
                                Map<String, dynamic> detailsData = {
                                  'title': data[index].title,
                                  // data[index].volumeInfo.title,
                                  'authors': data[index].author,
                                  //  data[index].volumeInfo.authors,
                                  'description': data[index].description,
                                  // data[index].volumeInfo.description,
                                  'thumbnail': data[index].coverImage,
                                  //  imageUrl,
                                  'categories': data[index].genre,
                                  '_id': data[index].bookId,
                                };
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => BookDetailsScreen(
                                          bookDetails: detailsData,
                                        ),
                                  ),
                                );
                              },
                              child: BookItem(
                                imagePath: data[index].coverImage,
                              ),
                            );
                          }),
                          // BookItem(
                          //     imagePath:
                          //         'http://books.google.com/books/content?id=V3lsKdY7X8MC&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
                          // BookItem(
                          //     imagePath:
                          //         'http://books.google.com/books/content?id=o_ea5_c4HxQC&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
                          // BookItem(
                          //     imagePath:
                          //         'http://books.google.com/books/content?id=9AuNEAAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api  '),
                        ),
                      );
                    },
                    error:
                        (error, stackTrace) => SizedBox(
                          height: 0.2.sh,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Text(
                              "No Books Found",
                              style: AppTypography.typo12PrimaryTextRegular,
                            ),
                          ),
                        ),
                    loading:
                        () => Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.primaryColor,
                            ),
                          ),
                        ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
