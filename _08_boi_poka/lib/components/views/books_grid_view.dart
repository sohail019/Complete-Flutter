import 'package:_08_boi_poka/components/custom_network_image.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class BooksGridView extends StatelessWidget {
  final List<dynamic> books;

  const BooksGridView({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final gridGap = screenWidth * 0.02;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: gridGap,
        mainAxisSpacing: gridGap,
        childAspectRatio: 0.68,
      ),
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];

        return FadeIn(
          animate: true,
          duration: Duration(milliseconds: 300),
          child: GestureDetector(
            onTap: () {},
            child: Column(
              children: [
                CustomNetworkImage(imageUrl: book["coverImage"]),
                SizedBox(height: 5),
                Text(
                  book["title"],
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  book["author"].join(", "),
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
