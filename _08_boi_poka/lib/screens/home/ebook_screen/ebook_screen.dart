import 'package:_08_boi_poka/components/icon_button.dart';
import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:_08_boi_poka/constants/app_routes.dart';
import 'package:_08_boi_poka/navigation/app_router.gr.dart';
import 'package:_08_boi_poka/providers/all_books_provider/all_books_provider.dart';
import 'package:_08_boi_poka/providers/filter_provider/author_provider.dart';
import 'package:_08_boi_poka/providers/filter_provider/genre_provider.dart';
import 'package:_08_boi_poka/screens/home/all_screen/all_books_grid_screen.dart';
import 'package:_08_boi_poka/screens/home/all_screen/all_books_list_view_screen.dart';
import 'package:_08_boi_poka/screens/home/ebook_screen/ebook_shelf_screen.dart';
import 'package:_08_boi_poka/screens/home/ebook_screen/toggle_ebook_view_provider.dart';
import 'package:_08_boi_poka/screens/home/widgets/custom_filter_header_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class EbookScreen extends ConsumerWidget {
  const EbookScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final selectedTab = ref.watch(toggleEBooksViewProvider);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
      child: Column(
        children: [
          Consumer(
            builder: (context, ref, child) {
              final selectedGenreFilter = ref.read(selectedGenreListProvider);
              final selectedAuthorFilter = ref.read(selectedAuthorListProvider);
              final isFilterActivated =
                  (selectedGenreFilter != null &&
                      selectedGenreFilter.isNotEmpty) ||
                  (selectedAuthorFilter != null &&
                      selectedAuthorFilter.isNotEmpty);
              final toggleFilterButton = ref.watch(ebookFilterToggleProvider);

              return Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // CustomLibraryDropdown(
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
                      if (selectedTab != EBookScreenEnum.shelf)
                        CustomFilterHeaderWidget(
                          ref: ref,
                          libraryStateProvider: null,
                          stateNotifierProvider: booksStateProvider,
                          onFilterTap: () {
                            context.router.push(
                              PageRouteInfo(
                                AppRoutes.filter,
                                args: FilterRouteArgs(
                                  libraryId: "",
                                  stateNotifierProvider: booksStateProvider,
                                  pageFilterToggleProvider:
                                      ebookFilterToggleProvider,
                                ),
                              ),
                            );
                          },
                        ),
                      if (!isFilterActivated)
                        SIconButton(
                          imgicon: AppImages.shelffilter,
                          isSelected: selectedTab == EBookScreenEnum.shelf,
                          onTap: () {
                            ref.read(toggleEBooksViewProvider.notifier).state =
                                EBookScreenEnum.shelf;
                          },
                        ),
                      SIconButton(
                        imgicon: AppImages.gridfilter,
                        isSelected: selectedTab == EBookScreenEnum.grid,
                        onTap: () {
                          ref.read(toggleEBooksViewProvider.notifier).state =
                              EBookScreenEnum.grid;
                        },
                      ),
                      SIconButton(
                        imgicon: AppImages.listfilter,
                        isSelected: selectedTab == EBookScreenEnum.list,
                        onTap: () {
                          ref.read(toggleEBooksViewProvider.notifier).state =
                              EBookScreenEnum.list;
                        },
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
          SizedBox(height: screenHeight * 0.03),
          Expanded(
            child:
                (selectedTab == EBookScreenEnum.shelf)
                    ? EBooksShelfScreen()
                    : selectedTab == EBookScreenEnum.grid
                    ? AllBooksGridViewScreen()
                    : selectedTab == EBookScreenEnum.list
                    ? AllBooksListViewScreen()
                    : Container(),
          ),
        ],
      ),
    );
  }
}
