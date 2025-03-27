import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:_08_boi_poka/constants/app_routes.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

const String svgString = '''
<svg width="24" height="22" viewBox="0 0 24 22" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M9.15994 10.5927C9.12994 10.5927 9.10994 10.5927 9.07994 10.5927C9.02994 10.5836 8.95994 10.5836 8.89994 10.5927C5.99994 10.511 3.80994 8.44264 3.80994 5.89341C3.80994 3.29883 6.13994 1.18506 8.99994 1.18506C11.8599 1.18506 14.1899 3.29883 14.1899 5.89341C14.1799 8.44264 11.9799 10.511 9.18994 10.5927C9.17994 10.5927 9.16994 10.5927 9.15994 10.5927ZM8.99994 2.54585C6.96994 2.54585 5.30994 4.0518 5.30994 5.89341C5.30994 7.70781 6.86994 9.16839 8.85994 9.2319C8.91994 9.22283 9.04994 9.22283 9.17994 9.2319C11.1399 9.15025 12.6799 7.68966 12.6899 5.89341C12.6899 4.0518 11.0299 2.54585 8.99994 2.54585Z" fill="#17283C"/>
<path d="M9.16973 20.5085C7.20973 20.5085 5.23973 20.0549 3.74973 19.1477C2.35973 18.3131 1.59973 17.17 1.59973 15.9272C1.59973 14.6843 2.35973 13.5322 3.74973 12.6885C6.74973 10.8831 11.6097 10.8831 14.5897 12.6885C15.9697 13.5231 16.7397 14.6662 16.7397 15.909C16.7397 17.1519 15.9797 18.304 14.5897 19.1477C13.0897 20.0549 11.1297 20.5085 9.16973 20.5085ZM4.57973 13.8315C3.61973 14.4121 3.09973 15.156 3.09973 15.9362C3.09973 16.7073 3.62973 17.4512 4.57973 18.0228C7.06973 19.5378 11.2697 19.5378 13.7597 18.0228C14.7197 17.4422 15.2397 16.6983 15.2397 15.9181C15.2397 15.147 14.7097 14.4031 13.7597 13.8315C11.2697 12.3256 7.06973 12.3256 4.57973 13.8315Z" fill="#17283C"/>
</svg>
''';

class CommonAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final List<Widget>? actions;
  final Function()? drawerFunction;
  const CommonAppbar({
    super.key,
    this.leading,
    this.actions,
    this.drawerFunction,
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
    // final screenHeight = MediaQuery.of(context).size.height;
    // final isPortrait = orientation == Orientation.portrait;

    final iconSize = 30.w;
    return AppBar(
      surfaceTintColor: AppColors.secondaryColor,
      backgroundColor: AppColors.secondaryColor,
      leadingWidth: 0.25.sw,
      leading: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 15.w),
          GestureDetector(
            onTap: drawerFunction,
            child: Image.asset(
              AppImages.menuIcon,
              fit: BoxFit.fill,
              width: iconSize,
              height: iconSize,
            ),
          ),
          SizedBox(width: 10.w),
          GestureDetector(
            child: Image.asset(
              AppImages.smLogo,
              fit: BoxFit.cover,
              width: iconSize,
              height: iconSize,
            ),
            onTap: () {},
          ),
        ],
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: screenWidth * 0.05),
          child: GestureDetector(
            child: SizedBox(
              // margin: EdgeInsets.all(5.0),
              width: iconSize * 0.9,
              height: iconSize * 0.9,
              child: SvgPicture.string(
                svgString,
                // fit: BoxFit.cover,
                height: iconSize,
                width: iconSize,
                allowDrawingOutsideViewBox: true,
                // color: Colors.yellow.shade600,
              ),
            ),
            onTap: () {
              context.pushRoute(PageRouteInfo(AppRoutes.profile));
            },
          ),
        ),
      ],
    );
  }
}
