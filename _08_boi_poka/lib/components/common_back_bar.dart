import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:flutter/material.dart';

class CommonBackBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final List<Widget>? actions;
  final String title;

  const CommonBackBar({
    super.key,
    this.leading,
    this.actions,
    required this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    // final isTablet =
    //     View.of(context).physicalSize.shortestSide /
    //         View.of(context).devicePixelRatio >=
    //     680;
    // var orientation = MediaQuery.of(context).orientation;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    // final isPortrait = orientation == Orientation.portrait;

    final iconSize = screenWidth * 0.075;

    return AppBar(
      surfaceTintColor: AppColors.secondaryColor,
      backgroundColor: AppColors.secondaryColor,
      toolbarHeight: screenHeight,
      leadingWidth: screenWidth,
      leading: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: screenWidth * 0.05),
          GestureDetector(
            child: Image.asset(
              AppImages.backArrow,
              fit: BoxFit.fill,
              // color: Colors.yellow.shade600,
              height: iconSize,
              width: iconSize,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(width: screenWidth * 0.03),
          SizedBox(
            width: screenWidth * 0.7,
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTypography.typo12PrimaryTextBold,
            ),
          ),
        ],
      ),
    );
  }
}
