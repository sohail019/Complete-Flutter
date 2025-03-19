import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBooks extends StatelessWidget {
  final int index;
  final String bookName;
  final String authorName;
  final int shelfIndex;
  final double height;
  final double width;
  final double thickness;
  final String colour;

  const CustomBooks({
    super.key,
    required this.index,
    required this.bookName,
    required this.authorName,
    required this.shelfIndex,
    required this.height,
    required this.width,
    required this.thickness,
    required this.colour,
  });

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [Colors.red, Colors.blue, Colors.green, Colors.yellow];
    Random random = Random();
    Color randomColor = colors[random.nextInt(colors.length)];
    return Container(
      margin: EdgeInsets.only(right: 4.0),
      height:
          height * 6.8 > 165
              ? 165
              : height * 6.8 < 110
              ? 110
              : height * 6.8,
      width: 27.w,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [randomColor, randomColor.withAlpha(150), randomColor],
        ),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        bookName,
                        style: TextStyle(
                          height: 1,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        authorName,
                        style: TextStyle(
                          height: 1,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: CircleAvatar(radius: 4, backgroundColor: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
