import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";

class Shelf extends StatelessWidget {
  final List<Widget> items;

  const Shelf({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
                items.length,
                (index) =>
                    items[index] // Ensures no error if fewer than 3 items
                ),
          ),
        );
      },
    );
  }
}
