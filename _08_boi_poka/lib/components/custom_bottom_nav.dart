import 'package:_08_boi_poka/components/tab_button.dart';
import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNav extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  const CustomBottomNav({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    // final isTablet =
    //     View.of(context).physicalSize.shortestSide /
    //         View.of(context).devicePixelRatio >=
    //     680;
    // var orientation = MediaQuery.of(context).orientation;
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    // final isPortrait = orientation == Orientation.portrait;

    // final plusIconSize = 16.w;
    // final bubbleIconParent = screenWidth * 0.15;
    return BottomAppBar(
      elevation: 8,
      height: 65.h,
      padding: EdgeInsets.all(0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 0.5,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.trackBackgroundColor,
                  offset: Offset(0, -1),
                  blurRadius: 10,
                  spreadRadius: 5,
                ),
              ],
            ),
          ),
          Container(
            color: AppColors.secondaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TabButton(
                  iconimg: items[0]['iconimg'],
                  isActive: selectedIndex == 0,
                  onTap: () => onTabSelected(0),
                  label: items[0]['label'],
                ),
                TabButton(
                  iconimg: items[1]['iconimg'],
                  isActive: selectedIndex == 1,
                  onTap: () => onTabSelected(1),
                  label: items[1]['label'],
                ),
                SizedBox(width: screenWidth * 0.15),
                TabButton(
                  iconimg: items[2]['iconimg'],
                  isActive: selectedIndex == 2,
                  onTap: () => onTabSelected(2),
                  label: items[2]['label'],
                ),
                TabButton(
                  iconimg: items[3]['iconimg'],
                  isActive: selectedIndex == 3,
                  onTap: () => onTabSelected(3),
                  label: items[3]['label'],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
