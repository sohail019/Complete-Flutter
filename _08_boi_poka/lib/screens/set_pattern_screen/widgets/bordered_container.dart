import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum BorderPosition { topLeft, topRight, bottomLeft, bottomRight }

class BorderedContainer extends StatelessWidget {
  final BorderPosition borderPosition;
  final bool isSelected;
  const BorderedContainer({
    super.key,
    required this.borderPosition,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    double left = 0, top = 0, right = 0, bottom = 0;
    Border border;
    switch (borderPosition) {
      case BorderPosition.topLeft:
        left = 0;
        top = 0;
        border = Border(
          left: BorderSide(
            width: 3,
            color: isSelected ? Colors.black : Colors.grey,
          ),
          top: BorderSide(
            width: 3,
            color: isSelected ? Colors.black : Colors.grey,
          ),
        );
        break;
      case BorderPosition.topRight:
        right = 0;
        top = 0;
        border = Border(
          right: BorderSide(
            width: 3,
            color: isSelected ? Colors.black : Colors.grey,
          ),
          top: BorderSide(
            width: 3,
            color: isSelected ? Colors.black : Colors.grey,
          ),
        );
        break;
      case BorderPosition.bottomLeft:
        left = 0;
        bottom = 0;
        border = Border(
          left: BorderSide(
            width: 3,
            color: isSelected ? Colors.black : Colors.grey,
          ),
          bottom: BorderSide(
            width: 3,
            color: isSelected ? Colors.black : Colors.grey,
          ),
        );
        break;
      case BorderPosition.bottomRight:
        right = 0;
        bottom = 0;
        border = Border(
          right: BorderSide(
            width: 3,
            color: isSelected ? Colors.black : Colors.grey,
          ),
          bottom: BorderSide(
            width: 3,
            color: isSelected ? Colors.black : Colors.grey,
          ),
        );
        break;
    }
    return Positioned(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      child: Container(
        height: 21.h,
        width: 24.w,
        decoration: BoxDecoration(border: border),
      ),
    );
  }
}
