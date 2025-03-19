import 'package:_08_boi_poka/screens/home/widgets/custom_books.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BooksShelfView extends StatelessWidget {
  final List<dynamic> bookShelves;
  const BooksShelfView({super.key, required this.bookShelves});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: bookShelves.length,
      itemBuilder: (context, shelfIndex) {
        List books = bookShelves[shelfIndex]['data'];
        bool showImage = bookShelves[shelfIndex]['showImage'];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 5),
                  height: shelfIndex == 0 ? 66 : 204,
                  width: 2,
                  color: Colors.black,
                ),
                ...List.generate(books.length, (index) {
                  double imageWidth = bookShelves[shelfIndex]['width'] ?? 0.0;
                  double imageHeight = bookShelves[shelfIndex]['height'] ?? 0.0;

                  return FadeIn(
                    animate: true,
                    duration: Duration(milliseconds: 300),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        (showImage &&
                                index == bookShelves[shelfIndex]["position"])
                            ? Container(
                              margin: EdgeInsets.only(right: 4.w),
                              height: imageHeight,
                              width: imageWidth,
                              child: Stack(
                                children: [
                                  bookShelves[shelfIndex]['image'] != null
                                      ? Center(
                                        child: Image.asset(
                                          bookShelves[shelfIndex]['image'],
                                        ),
                                      )
                                      : SizedBox.shrink(),
                                ],
                              ),
                            )
                            : GestureDetector(
                              onTap: () {},
                              child: CustomBooks(
                                index: index,
                                authorName:
                                    books[index]?.bookDetails?.author?[0] ?? "",
                                bookName:
                                    books[index]?.bookDetails?.title ?? "",
                                shelfIndex: shelfIndex,
                                height:
                                    books[index]?.bookDetails?.bookHeight ??
                                    0.0,
                                width:
                                    books[index]?.bookDetails?.bookWidth ?? 0.0,
                                thickness:
                                    books[index]?.bookDetails?.bookThickness ??
                                    0.0,
                                colour: books[index]?.bookDetails?.color ?? "",
                              ),
                            ),
                      ],
                    ),
                  );
                }),

                Spacer(),
                Container(
                  height: shelfIndex == 0 ? 66 : 204,
                  width: 2,
                  color: Colors.black,
                ),
              ],
            ),
            Container(
              height: 4,
              decoration: BoxDecoration(
                color: Colors.black,
                boxShadow: [BoxShadow(blurRadius: 14, offset: Offset(6, 10))],
              ),
            ),
          ],
        );
      },
    );
  }
}
