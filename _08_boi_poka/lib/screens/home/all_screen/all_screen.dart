import 'package:_08_boi_poka/components/icon_button.dart';
import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:_08_boi_poka/constants/app_routes.dart';
import 'package:_08_boi_poka/navigation/app_router.gr.dart';
import 'package:_08_boi_poka/providers/all_books_provider/all_books_provider.dart';
import 'package:_08_boi_poka/providers/filter_provider/author_provider.dart';
import 'package:_08_boi_poka/providers/filter_provider/genre_provider.dart';
import 'package:_08_boi_poka/screens/home/all_screen/all_books_grid_screen.dart';
import 'package:_08_boi_poka/screens/home/all_screen/all_books_list_view_screen.dart';
import 'package:_08_boi_poka/screens/home/all_screen/all_books_shelf_screen.dart';
import 'package:_08_boi_poka/screens/home/all_screen/change_all_screen_view_provider.dart';
import 'package:_08_boi_poka/screens/home/widgets/custom_filter_header_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllScreen extends ConsumerWidget {
  // final selectedTab = ref.watch(allBooksViewToggleProvider);
  const AllScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isTablet =
        View.of(context).physicalSize.shortestSide /
            View.of(context).devicePixelRatio >=
        680;
    var orientation = MediaQuery.of(context).orientation;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isPortrait = orientation == Orientation.portrait;

    final selectedTab = ref.watch(allBooksViewToggleProvider);
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
              // To hide and show filter button in case filter is applied
              final toggleFilterButton = ref.watch(
                allBooksFilterToggleProvider,
              );
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Spacer(),
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
                                allBooksFilterToggleProvider,
                            // listGridControllerProvider:
                            //     listGridControllerProvider,
                            // shelfControllerProvider: shelfControllerProvider,
                          ),
                        ),
                      );
                    },
                  ),
                  if (!isFilterActivated)
                    SIconButton(
                      imgicon: AppImages.shelffilter,
                      isSelected: selectedTab == AllBooksScreenSections.shelf,
                      onTap: () {
                        ref.read(allBooksViewToggleProvider.notifier).state =
                            AllBooksScreenSections.shelf;
                      },
                    ),
                  SIconButton(
                    imgicon: AppImages.gridfilter,
                    isSelected: selectedTab == AllBooksScreenSections.grid,
                    onTap: () {
                      ref.read(allBooksViewToggleProvider.notifier).state =
                          AllBooksScreenSections.grid;
                    },
                  ),
                  SIconButton(
                    imgicon: AppImages.listfilter,
                    isSelected: selectedTab == AllBooksScreenSections.list,
                    onTap: () {
                      ref.read(allBooksViewToggleProvider.notifier).state =
                          AllBooksScreenSections.list;
                    },
                  ),
                ],
              );
            },
          ),
          SizedBox(height: screenHeight * 0.03),
          Expanded(
            child:
                (selectedTab == AllBooksScreenSections.shelf)
                    ? AllBooksShelfScreen()
                    : selectedTab == AllBooksScreenSections.grid
                    ? AllBooksGridViewScreen()
                    : selectedTab == AllBooksScreenSections.list
                    ? AllBooksListViewScreen()
                    : Container(),
          ),
        ],
      ),
    );
  }
}
