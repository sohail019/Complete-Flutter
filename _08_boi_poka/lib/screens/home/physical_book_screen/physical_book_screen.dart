import 'package:_08_boi_poka/components/icon_button.dart';
import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:_08_boi_poka/constants/app_routes.dart';
import 'package:_08_boi_poka/navigation/app_router.gr.dart';
import 'package:_08_boi_poka/providers/filter_provider/author_provider.dart';
import 'package:_08_boi_poka/providers/filter_provider/genre_provider.dart';
import 'package:_08_boi_poka/providers/physical_books_provider/physical_books_provider.dart';
import 'package:_08_boi_poka/screens/home/physical_book_screen/toggle_physical_view_provider.dart';
import 'package:_08_boi_poka/screens/home/widgets/custom_filter_header_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class PhysicalBookScreen extends ConsumerWidget {
  const PhysicalBookScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final selectedTab = ref.watch(togglePhysicalViewProvider);

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
                  Text("Custom Library Dropdown comes here"),
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
                        isSelected: selectedTab == PhysicalBooksScreenEnum.grid,
                        onTap: () {
                          ref.read(togglePhysicalViewProvider.notifier).state =
                              PhysicalBooksScreenEnum.grid;
                        },
                      ),
                      SIconButton(
                        imgicon: AppImages.listfilter,
                        isSelected: selectedTab == PhysicalBooksScreenEnum.list,
                        onTap: () {
                          ref.read(togglePhysicalViewProvider.notifier).state =
                              PhysicalBooksScreenEnum.list;
                        },
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
          SizedBox(height: screenHeight * 0.03),
          Expanded(child: Center(child: Text("Physical Book Screen"))),
        ],
      ),
    );
  }
}
