import 'package:_08_boi_poka/components/icon_button.dart';
import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:_08_boi_poka/constants/app_routes.dart';
import 'package:_08_boi_poka/controller/books_controller.dart';
import 'package:_08_boi_poka/models/get_all_books_model.dart';
import 'package:_08_boi_poka/navigation/app_router.gr.dart';
import 'package:_08_boi_poka/providers/all_books_provider/all_books_provider.dart';
import 'package:_08_boi_poka/providers/audio_books_provider/audio_books_provider.dart';
import 'package:_08_boi_poka/providers/filter_provider/author_provider.dart';
import 'package:_08_boi_poka/providers/filter_provider/genre_provider.dart';
import 'package:_08_boi_poka/screens/home/audio_book_screen/audio_books_grid_screen.dart';
import 'package:_08_boi_poka/screens/home/audio_book_screen/audio_books_list_screen.dart';
import 'package:_08_boi_poka/screens/home/audio_book_screen/audio_books_shelf_screen.dart';
import 'package:_08_boi_poka/screens/home/audio_book_screen/toggle_audiobook_view_provider.dart';
import 'package:_08_boi_poka/screens/home/widgets/custom_filter_header_widget.dart';
import 'package:_08_boi_poka/screens/home/widgets/custom_library_dropdown.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class AudioBookScreen extends ConsumerStatefulWidget {
  const AudioBookScreen({super.key});

  @override
  AudioBookScreenState createState() => AudioBookScreenState();
}

class AudioBookScreenState extends ConsumerState<AudioBookScreen> {
  final booksController = BooksController();
  bool isLoading = true;

  List<BookData> allBooks = [];

  @override
  void initState() {
    // TODO: implement initState
    booksController.getAllBooks(bookType: "audioBook").then((value) {
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
    final selectedTab = ref.watch(toggleAudioBooksViewProvider);
    return isLoading
        ? Center(child: CircularProgressIndicator())
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
                  final toggleFilterButton = ref.watch(
                    audioFilterToggleProvider,
                  );

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomLibraryDropdown(
                        ref: ref,
                        stateNotifierProvider: audioBooksStateProvider,
                        selectedLibrary: selectedAudioLibrary,
                        getBookData: (String libraryId) {
                          setState(() {
                            isLoading = true;
                          });
                          booksController
                              .getAllBooks(
                                bookType: "audioBook",
                                libraryId: libraryId,
                              )
                              .then((value) {
                                allBooks = value.data ?? [];
                                setState(() {
                                  isLoading = false;
                                });
                              });
                        },
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
                              isSelected:
                                  selectedTab == AudioBooksScreenEnum.shelf,
                              onTap: () {
                                ref
                                    .read(toggleAudioBooksViewProvider.notifier)
                                    .state = AudioBooksScreenEnum.shelf;
                              },
                            ),
                          SIconButton(
                            imgicon: AppImages.gridfilter,
                            isSelected:
                                selectedTab == AudioBooksScreenEnum.grid,
                            onTap: () {
                              ref
                                  .read(toggleAudioBooksViewProvider.notifier)
                                  .state = AudioBooksScreenEnum.grid;
                            },
                          ),
                          SIconButton(
                            imgicon: AppImages.listfilter,
                            isSelected:
                                selectedTab == AudioBooksScreenEnum.list,
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
                        ? AudioBooksGridViewScreen(audioBooksData: allBooks)
                        : selectedTab == AudioBooksScreenEnum.list
                        ? AudioBooksListViewScreen(audioBooksData: allBooks)
                        : Container(),
              ),
            ],
          ),
        );
  }
}
