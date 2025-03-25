import 'package:_08_boi_poka/components/icon_button.dart';
import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:_08_boi_poka/constants/app_routes.dart';
import 'package:_08_boi_poka/controller/books_controller.dart';
import 'package:_08_boi_poka/models/get_all_books_model.dart';
import 'package:_08_boi_poka/navigation/app_router.gr.dart';
import 'package:_08_boi_poka/providers/filter_provider/author_provider.dart';
import 'package:_08_boi_poka/providers/filter_provider/genre_provider.dart';
import 'package:_08_boi_poka/providers/physical_books_provider/physical_books_provider.dart';
import 'package:_08_boi_poka/screens/home/physical_book_screen/physical_books_grid_view_screen.dart';
import 'package:_08_boi_poka/screens/home/physical_book_screen/physical_books_list_screen.dart';
import 'package:_08_boi_poka/screens/home/physical_book_screen/physical_books_shelf_screen.dart';
import 'package:_08_boi_poka/screens/home/physical_book_screen/toggle_physical_view_provider.dart';
import 'package:_08_boi_poka/screens/home/widgets/custom_filter_header_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class PhysicalBookScreen extends ConsumerStatefulWidget {
  const PhysicalBookScreen({super.key});

  @override
  PhysicalBookScreenState createState() => PhysicalBookScreenState();
}

class PhysicalBookScreenState extends ConsumerState<PhysicalBookScreen> {
  final booksController = BooksController();
  bool isLoading = true;

  List<BookData> allBooks = [];

  @override
  void initState() {
    // TODO: implement initState
    booksController.getAllBooks(bookType: "physicalBook").then((value) {
      allBooks = value.data ?? [];
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final selectedTab = ref.watch(togglePhysicalViewProvider);
    return isLoading
        ? CircularProgressIndicator()
        : Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
          child: Column(
            children: [
              Consumer(
                builder: (context, ref, child) {
                  final selectedGenreFilter = ref.read(
                    selectedGenreListProvider,
                  );
                  final selectedAuthorFilter = ref.read(
                    selectedAuthorListProvider,
                  );
                  final isFilterActivated =
                      (selectedGenreFilter != null &&
                          selectedGenreFilter.isNotEmpty) ||
                      (selectedAuthorFilter != null &&
                          selectedAuthorFilter.isNotEmpty);
                  // To hide and show filter button in case filter is applied
                  final toggleFilterButton = ref.watch(
                    physicalFilterToggleProvider,
                  );

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      //  CustomLibraryDropdown(
                      //   ref: ref,
                      //   stateNotifierProvider: physicalBooksStateProvider,
                      //   selectedLibrary: selectedPhysicalLibrary,
                      // ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.35,
                        child: Text(
                          "Custom Library Dropdown comes here",
                          maxLines: 2,
                        ),
                      ),
                      Spacer(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (selectedTab != PhysicalBooksScreenEnum.shelf)
                            CustomFilterHeaderWidget(
                              ref: ref,
                              stateNotifierProvider: physicalBooksStateProvider,
                              onFilterTap: () {
                                context.router.push(
                                  PageRouteInfo(
                                    AppRoutes.filter,
                                    args: FilterRouteArgs(
                                      // listGridControllerProvider:
                                      //     physicalPagingControllerProvider,
                                      // shelfControllerProvider:
                                      //     physicalShelfPagingProvider,
                                      pageFilterToggleProvider:
                                          physicalFilterToggleProvider,
                                      stateNotifierProvider:
                                          physicalBooksStateProvider,
                                      // libraryId:
                                      //     ref.read(selectedPhysicalLibrary) ??
                                      //         ""),
                                      libraryId: "",
                                    ),
                                  ),
                                );
                              },
                            ),
                          if (!isFilterActivated)
                            SIconButton(
                              imgicon: AppImages.shelffilter,
                              isSelected:
                                  selectedTab == PhysicalBooksScreenEnum.shelf,
                              onTap: () {
                                ref
                                    .read(togglePhysicalViewProvider.notifier)
                                    .state = PhysicalBooksScreenEnum.shelf;
                              },
                            ),
                          SIconButton(
                            imgicon: AppImages.gridfilter,
                            isSelected:
                                selectedTab == PhysicalBooksScreenEnum.grid,
                            onTap: () {
                              ref
                                  .read(togglePhysicalViewProvider.notifier)
                                  .state = PhysicalBooksScreenEnum.grid;
                            },
                          ),
                          SIconButton(
                            imgicon: AppImages.listfilter,
                            isSelected:
                                selectedTab == PhysicalBooksScreenEnum.list,
                            onTap: () {
                              ref
                                  .read(togglePhysicalViewProvider.notifier)
                                  .state = PhysicalBooksScreenEnum.list;
                            },
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 26.h),
              Expanded(
                child:
                    (selectedTab == PhysicalBooksScreenEnum.shelf)
                        ? PhysicalBooksShelfScreen()
                        : selectedTab == PhysicalBooksScreenEnum.grid
                        ? PhysicalBooksGridViewScreen(bookData: allBooks)
                        : selectedTab == PhysicalBooksScreenEnum.list
                        ? PhysicalBooksListViewScreen(bookData: allBooks)
                        : Container(),
              ),
            ],
          ),
        );
  }
}
