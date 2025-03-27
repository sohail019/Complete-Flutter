import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  final String imagePath;

  const BookItem({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final isTablet = View.of(context).physicalSize.shortestSide /
            View.of(context).devicePixelRatio >=
        680;
    var orientation = MediaQuery.of(context).orientation;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isPortrait = orientation == Orientation.portrait;

    return Container(
      margin: EdgeInsets.only(
        right: screenWidth * 0.03,
      ),
      width: screenWidth * 0.28,
      height: screenHeight * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.5),
        //     blurRadius: 5,
        //     offset: const Offset(0, 5),
        //   ),
        // ],
        image: DecorationImage(
          image: NetworkImage(imagePath),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
