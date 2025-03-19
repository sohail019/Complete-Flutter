import 'package:_08_boi_poka/components/icon_button.dart';
import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:_08_boi_poka/constants/app_routes.dart';
import 'package:_08_boi_poka/navigation/app_router.gr.dart';
import 'package:_08_boi_poka/providers/all_books_provider/all_books_provider.dart';
import 'package:_08_boi_poka/providers/filter_provider/author_provider.dart';
import 'package:_08_boi_poka/providers/filter_provider/genre_provider.dart';
import 'package:_08_boi_poka/screens/home/all_screen/all_books_grid_screen.dart';
import 'package:_08_boi_poka/screens/home/all_screen/all_books_list_view_screen.dart';
import 'package:_08_boi_poka/screens/home/audio_book_screen/audio_books_shelf_screen.dart';
import 'package:_08_boi_poka/screens/home/audio_book_screen/toggle_audiobook_view_provider.dart';
import 'package:_08_boi_poka/screens/home/widgets/custom_filter_header_widget.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class AudioBookScreen extends ConsumerWidget {
  const AudioBookScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final selectedTab = ref.watch(toggleAudioBooksViewProvider);

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
              final toggleFilterButton = ref.watch(audioFilterToggleProvider);

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
                      if (selectedTab != AudioBooksScreenEnum.shelf)
                        CustomFilterHeaderWidget(
                          ref: ref,
                          stateNotifierProvider: booksStateProvider,
                          onFilterTap: () {
                            context.router.push(
                              PageRouteInfo(
                                AppRoutes.filter,
                                args: FilterRouteArgs(
                                  libraryId: "",
                                  stateNotifierProvider: booksStateProvider,
                                  pageFilterToggleProvider:
                                      audioFilterToggleProvider,
                                ),
                              ),
                            );
                          },
                        ),
                      if (!isFilterActivated)
                        SIconButton(
                          imgicon: AppImages.shelffilter,
                          isSelected: selectedTab == AudioBooksScreenEnum.shelf,
                          onTap: () {
                            ref
                                .read(toggleAudioBooksViewProvider.notifier)
                                .state = AudioBooksScreenEnum.shelf;
                          },
                        ),
                      SIconButton(
                        imgicon: AppImages.gridfilter,
                        isSelected: selectedTab == AudioBooksScreenEnum.grid,
                        onTap: () {
                          ref
                              .read(toggleAudioBooksViewProvider.notifier)
                              .state = AudioBooksScreenEnum.grid;
                        },
                      ),
                      SIconButton(
                        imgicon: AppImages.listfilter,
                        isSelected: selectedTab == AudioBooksScreenEnum.list,
                        onTap: () {
                          ref
                              .read(toggleAudioBooksViewProvider.notifier)
                              .state = AudioBooksScreenEnum.list;
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
                (selectedTab == AudioBooksScreenEnum.shelf)
                    ? AudioBooksShelfScreen()
                    : selectedTab == AudioBooksScreenEnum.grid
                    ? AllBooksGridViewScreen()
                    : selectedTab == AudioBooksScreenEnum.list
                    ? AllBooksListViewScreen()
                    : Container(),
          ),
        ],
      ),
    );
  }
}
