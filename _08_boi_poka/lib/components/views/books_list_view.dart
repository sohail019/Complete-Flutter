import 'package:_08_boi_poka/components/custom_network_image.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class BooksListView extends StatelessWidget {
  final List<dynamic> books;

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
              onTap: () {},
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomNetworkImage(imageUrl: book['coverImage']),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: screenWidth * 0.5,
                          child: Text(
                            book["title"],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: AppTypography.title20PrimaryTextBold,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        SizedBox(
                          width: screenWidth * 0.5,
                          child: Text(
                            book["author"].join(", "),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: AppTypography.typo12PrimaryTextRegular,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        SizedBox(
                          width: screenWidth * 0.5,
                          child: Text(
                            book["description"],
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
