import 'dart:io';
import 'package:_08_boi_poka/components/common_back_bar.dart';
import 'package:_08_boi_poka/components/custom_checkbox_widget.dart';
import 'package:_08_boi_poka/components/custom_drawer.dart';
import 'package:_08_boi_poka/components/snackbar_widget.dart';
import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_routes.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:_08_boi_poka/controller/books_controller.dart';
import 'package:_08_boi_poka/controller/pagination_controller_service.dart';
import 'package:_08_boi_poka/core/services/datasources/shared_preference_impl.dart';
import 'package:_08_boi_poka/modals/showCustomLibraryDialog.dart';
import 'package:_08_boi_poka/models/add_book_request_modal.dart';
import 'package:_08_boi_poka/models/ocr_book_model.dart';
import 'package:_08_boi_poka/providers/audio_books_provider/audio_books_provider.dart';
import 'package:_08_boi_poka/providers/e_books_provider/ebooks_provider.dart';
import 'package:_08_boi_poka/providers/library_provider/get_all_library_provider.dart';
import 'package:_08_boi_poka/providers/physical_books_provider/physical_books_provider.dart';
import 'package:_08_boi_poka/screens/home/filter_page/widgets/filter_bottom_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:palette_generator/palette_generator.dart';
import 'ocr_book_items/ocr_book_items.dart';

@RoutePage()
class SelectFetchedBooksScreen extends ConsumerStatefulWidget {
  final File? imageFile;
  final WidgetRef? ref;
  final String libraryName;
  final bool isOnboarded;
  final OcrBookModel bookOcrModel;
  final bool isCreatingLibrary;

  const SelectFetchedBooksScreen({
    this.ref,
    required this.isCreatingLibrary,
    this.imageFile,
    required this.libraryName,
    required this.isOnboarded,
    required this.bookOcrModel,
    super.key,
  });

  @override
  // State<SelectFetchedBooksScreen> createState() => _SelectFetchedBooksScreenState();
  SelectFetchedBooksScreenState createState() =>
      SelectFetchedBooksScreenState();
}

class SelectFetchedBooksScreenState
    extends ConsumerState<SelectFetchedBooksScreen> {
  List<OcrBook> allOcrFoundBooksList = [];
  List<OcrBook> allOcrNotFoundBooksList = [];
  bool isFoundActive = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isSelectAllActive = false;
  final PaginationControllerService paginationControllerService =
      PaginationControllerService();
  AddBookRequest addBookRequest = AddBookRequest(books: []);

  @override
  void initState() {
    super.initState();
    /*initialize the data*/
    initializeData();
  }

  void initializeData() {
    List<OcrBook> allOcrBooksList = widget.bookOcrModel.data!;
    for (var book in allOcrBooksList) {
      if (book.found) {
        isFoundActive = true;
        allOcrFoundBooksList.add(book);
      } else {
        allOcrNotFoundBooksList.add(book);
      }
    }
  }

  void onCheckboxChanged(int index, bool isChecked) {
    setState(() {
      allOcrFoundBooksList[index].isChecked = isChecked;
    });
  }

  void onRowClicked(BuildContext context, BookData bookData) {
    // Handle row click (for example, navigate to a detail screen)
  }

  void selectAllBooks(BuildContext context, bool? isChecked) async {
    /*Call api to reject and remove the member form the list*/
    try {
      context.loaderOverlay.show();
      setState(() {
        isSelectAllActive = isChecked ?? false;
      });
      allOcrFoundBooksList =
          allOcrFoundBooksList.map((item) {
            if (item.found) {
              item.isChecked = isChecked ?? false;
            }
            return item; // Return the item unmodified if the id doesn't match
          }).toList();
      context.loaderOverlay.hide();
    } catch (e) {
      context.loaderOverlay.hide();
    }
  }

  Color getTextColor(Color backgroundColor) {
    return backgroundColor.computeLuminance() > 0.5
        ? Colors.black
        : Colors.white;
  }

  String colorToHex(Color color, {bool leadingHashSign = true}) {
    return "${leadingHashSign ? '#' : ''}"
            "${color.alpha.toRadixString(16).padLeft(2, '0')}"
            "${color.red.toRadixString(16).padLeft(2, '0')}"
            "${color.green.toRadixString(16).padLeft(2, '0')}"
            "${color.blue.toRadixString(16).padLeft(2, '0')}"
        .toUpperCase();
  }

  Future<void> addBooksToList(String libraryName) async {
    // Create a list of Future objects to hold the asynchronous operations
    List<Future> futures = [];
    // Loop through all the books and add each operation to the futures list
    allOcrFoundBooksList.forEach((ocrBook) {
      if (ocrBook.isChecked) {
        futures.add(
          // Perform the asynchronous operations for each book
          getDominantColorFromImage(ocrBook.data?.coverImage).then((
            imgColor,
          ) async {
            final imgColorHex = getHexFromARGB(imgColor!);
            final textColor = getTextColor(imgColor);
            final textHexColor = getHexFromARGB(textColor);
            BookSource sourcePayload = BookSource(
              sourceName: "Physical",
              sourceType: "physicalBook",
            );
            AddBookData bookPayload = AddBookData(
              bookId: ocrBook.data!.id!,
              readProgress: 0,
              status: "reading",
              libraryName: libraryName,
              location: [1, 1],
              source: sourcePayload,
              color: imgColorHex,
              textColor: textHexColor,
            );
            // Add the book to the addBookRequest
            addBookRequest.books.add(bookPayload);
          }),
        );
      }
    });
    // Wait for all the futures to complete
    await Future.wait(futures);
  }

  void addBookToLibrary(
    BuildContext context,
    String libName,
    String libId,
  ) async {
    try {
      String libraryName = libName;
      if (libId.isNotEmpty) {
        libraryName = libId;
      }
      context.loaderOverlay.show();
      await addBooksToList(libraryName);
      final addBookController = BooksController();
      addBookController
          .addBooks(books: addBookRequest, context: context)
          .then((value) {
            // Refresh Page Controllers
            if (!widget.isCreatingLibrary) {
              Future.microtask(() {
                paginationControllerService.resetPagingController(widget.ref!);
                widget.ref!.read(libraryProvider.notifier).refreshLibrary();
                final library = widget.ref?.read(libraryProvider);
                widget.ref!.read(selectedAudioLibrary.notifier).state =
                    library?.value?.first.libraryId;
                widget.ref!.read(selectedEbookLibrary.notifier).state =
                    library?.value?.first.libraryId;
                widget.ref!.read(selectedPhysicalLibrary.notifier).state =
                    library?.value?.first.libraryId;
              });
            } else {
              // paginationControllerService.resetOnCreateController(widget.ref!);
            }
            context.loaderOverlay.hide();
            Navigator.pop(context);
            SnackbarWidget(
              textToShow: "Books added to library $libName",
              durationInMilliseconds: 3000,
              backgroundColor: AppColors.snackBarSuccess,
              context: context,
            );
            final sharedPref = SharedPrefController();
            Future.microtask(() async {
              try {
                await sharedPref.storeBool("onBoarded", true);
              } catch (e) {
                print(e);
              }
              try {
                await ref.read(libraryProvider.notifier).refreshLibrary();
              } catch (e) {
                print(e);
              }
              context.router.pushAndPopUntil(
                PageRouteInfo(AppRoutes.homeScreen),
                predicate: (route) => false,
              );
            });
            // context.router.pushAndPopUntil(PageRouteInfo(AppRoutes.homeScreen),
            //     predicate: (route) => false);
            // Handle success response
          })
          .onError((error, stackTrace) {
            context.loaderOverlay.hide();
            Navigator.pop(context);
          });
    } catch (e) {
      context.loaderOverlay.hide();
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double screenHeight = MediaQuery.sizeOf(context).height;

    final isTablet =
        View.of(context).physicalSize.shortestSide /
            View.of(context).devicePixelRatio >=
        680;

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppColors.secondaryColor,
      // resizeToAvoidBottomInset: false,
      appBar:
          isTablet
              ? PreferredSize(
                preferredSize: Size.fromHeight(screenHeight * 0.1),
                child: CommonBackBar(title: ''),
              )
              : CommonBackBar(title: ''),
      drawer: CustomDrawer(),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.03),
          child: CustomScrollView(
            slivers: [
              // The image section (InteractiveViewer) in the first part
              SliverToBoxAdapter(
                child: InteractiveViewer(
                  minScale: 0.1,
                  maxScale: 2.0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.primaryColor,
                          width: 2.w,
                        ),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.w),
                        child: Center(
                          child: Stack(
                            children: [
                              widget.imageFile != null
                                  ? Image.file(
                                    widget.imageFile!,
                                    width: screenWidth,
                                    height: screenHeight * 0.35, //640
                                    fit: BoxFit.contain,
                                  )
                                  : Image.asset(
                                    "lib/assets/images/shelf_icons/poka.png",
                                    width: screenWidth,
                                    height: screenHeight * 0.35, //640
                                    fit: BoxFit.contain,
                                  ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(height: 24.h),
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Container(
                        width: double.infinity,
                        // Make the container take up the full width
                        padding: EdgeInsets.only(left: 10, right: 10),
                        // Added padding for right side
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: AppColors.dividerColor,
                              width: 1.0,
                            ),
                          ), // Underline
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // Space out the elements
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isFoundActive = true;
                                });
                              },
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "${allOcrFoundBooksList.length} identified",
                                  style:
                                      AppTypography.title18PrimaryTextRegular,
                                ),
                              ),
                            ),
                            if (allOcrNotFoundBooksList.isNotEmpty)
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isFoundActive = false;
                                  });
                                },
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "${allOcrNotFoundBooksList.length} doubtful",
                                    style:
                                        AppTypography.title18PrimaryTextRegular,
                                  ),
                                ),
                              ),
                            Row(
                              children: [
                                Text(
                                  "select all",
                                  style: AppTypography.typo10PrimaryTextRegular,
                                ),
                                // Label next to checkbox
                                CustomCheckboxWidget(
                                  value:
                                      isFoundActive ? isSelectAllActive : false,
                                  // Example value, modify based on your state
                                  onChanged:
                                      (bool? newValue) => {
                                        if (isFoundActive)
                                          {selectAllBooks(context, newValue)},
                                      },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    OcrBook ocrBook =
                        isFoundActive
                            ? allOcrFoundBooksList[index]
                            : allOcrNotFoundBooksList[index];
                    return Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: OCRBookItem(
                        ocrBookData: ocrBook,
                        onItemClick: (BookData itemId) {},
                        onCheckboxChanged: (bool isChecked) {
                          setState(() {
                            if (isFoundActive) {
                              allOcrFoundBooksList[index].isChecked = isChecked;
                              bool hasCheckedItem = allOcrFoundBooksList.any(
                                (item) => !item.isChecked,
                              );
                              setState(() {
                                isSelectAllActive = !hasCheckedItem;
                              });
                            }
                          });
                        },
                      ),
                    );
                  },
                  childCount:
                      isFoundActive
                          ? allOcrFoundBooksList.length
                          : allOcrNotFoundBooksList.length,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: FilterBottomBar(
        title: 'add books',
        onTap: () {
          if (allOcrFoundBooksList.length != 0) {
            bool hasCheckedItem = allOcrFoundBooksList.any(
              (item) => item.isChecked,
            );
            // print("hasCheckedItem--->"+hasCheckedItem.toString());
            if (hasCheckedItem == false) {
              SnackbarWidget(
                textToShow: "Please select book to add in library",
                durationInMilliseconds: 3000,
                backgroundColor: AppColors.snackBarSuccess,
                context: context,
              );
              return;
            }
            showCustomLibraryDialog(
              context,
              widget.isOnboarded == true ? "REGISTER" : "ADD_ITEM",
              (cont, libraryName, libraryId) =>
                  addBookToLibrary(context, libraryName, libraryId),
              widget.isCreatingLibrary,
            );
          }
        },
      ),
    );
  }

  String getHexFromARGB(Color myColor) {
    // Format each value to two hex digits and combine
    return '#${myColor.value.toRadixString(16)}';
  }

  Future<Color?> getDominantColorFromImage(String? imageUrl) async {
    if (imageUrl != null && imageUrl.isNotEmpty) {
      final PaletteGenerator paletteGenerator =
          await PaletteGenerator.fromImageProvider(
            NetworkImage(imageUrl),
            maximumColorCount:
                20, // Optional: controls how many colors to analyze
          );
      final color = paletteGenerator.colors.first;
      // Returns the dominant color (can also explore vibrant/muted colors)
      return paletteGenerator.dominantColor?.color;
    } else {
      return Colors.black;
    }
  }
}
