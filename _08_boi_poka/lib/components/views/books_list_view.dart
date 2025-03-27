import 'package:_08_boi_poka/components/custom_network_image.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:_08_boi_poka/models/get_all_books_model.dart';
import 'package:_08_boi_poka/screens/book_details/book_details_screen.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class BooksListView extends StatelessWidget {
  final List<BookData> books;

  const BooksListView({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;

    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];

        return FadeIn(
          duration: Duration(milliseconds: 500),
          animate: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: GestureDetector(
              onTap: () {
                Map<String, dynamic> bookDetails = {
                  'title': book.bookDetails?.title ?? '',
                  'authors': book.bookDetails?.author?.join(", ") ?? '',
                  'description':
                      book.bookDetails?.description ??
                      'No description available.',
                  'thumbnail': book.bookDetails?.coverImage ?? '',
                  '_id': book.bookDetails?.id ?? '',
                  'genre': book.bookDetails?.genre ?? '',
                  'libraryName': book.libraryName,
                  'row': book.row,
                  'column': book.column,
                };

                // Navigate to the BookDetailsScreen with the selected book's details
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) =>
                            BookDetailsScreen(bookDetails: bookDetails),
                  ),
                );
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomNetworkImage(imageUrl: book.bookDetails?.coverImage),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: screenWidth * 0.5,
                          child: Text(
                            book.bookDetails?.title ?? "",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: AppTypography.title20PrimaryTextBold,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        SizedBox(
                          width: screenWidth * 0.5,
                          child: Text(
                            book.bookDetails?.author?.join(", ") ?? "",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: AppTypography.typo12PrimaryTextRegular,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        SizedBox(
                          width: screenWidth * 0.5,
                          child: Text(
                            book.bookDetails?.description ?? "",
                            style: AppTypography.typo12PrimaryTextLight,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
