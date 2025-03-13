import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';

import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";

class GenreWidget extends StatefulWidget {
  final String? iconImg;
  final String text;
  final VoidCallback onTap;

  const GenreWidget({
    super.key,
    this.iconImg,
    required this.text,
    required this.onTap,
  });

  @override
  State<GenreWidget> createState() => _GenreWidgetState();
}

class _GenreWidgetState extends State<GenreWidget> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final isTablet =
    //     View.of(context).physicalSize.shortestSide /
    //         View.of(context).devicePixelRatio >=
    //     680;
    // var orientation = MediaQuery.of(context).orientation;
    // final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    // final isPortrait = orientation == Orientation.portrait;

    final genreIconSize = 30.w;
    final likeIconSize = 10.w;

    return InkWell(
      splashFactory: NoSplash.splashFactory, // Disables ripple effect
      highlightColor: Colors.transparent, // Removes highlight effect
      onTap: () {
        widget.onTap();
        toggleFavorite();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            fit: StackFit.passthrough,
            alignment: Alignment.center,
            children: [
              if (widget.iconImg != null)
                Padding(
                  padding: EdgeInsets.only(right: 0.08.sw),
                  child: Image.asset(
                    widget.iconImg!,
                    height: genreIconSize,
                    width: genreIconSize,
                    fit: BoxFit.contain,
                  ),
                ),
              if (isFavorite)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Icon(
                    Icons.favorite,
                    color: AppColors.likeIconColor,
                    size: likeIconSize,
                  ),
                ),
            ],
          ),
          SizedBox(height: 3.h),
          Container(
            height: 1.h,
            width: 0.17.sw,
            color: AppColors.genreIconSeparator,
          ),
          SizedBox(height: 2.h),
          Text(
            widget.text,
            style: AppTypography.typo9PrimaryTextRegular,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
