import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:flutter/material.dart';

class CustomTabbar extends StatelessWidget {
  final List<String> tabs;
  final Color indicatorColor;
  final Color labelColor;
  final List<Widget> screens;
  const CustomTabbar({
    super.key,
    required this.tabs,
    required this.indicatorColor,
    required this.labelColor,
    required this.screens,
  });

  @override
  Widget build(BuildContext context) {
    final isTablet =
        View.of(context).physicalSize.shortestSide /
            View.of(context).devicePixelRatio >=
        680;
    var orientation = MediaQuery.of(context).orientation;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isPortrait = orientation == Orientation.portrait;

    // final double tabLabelPadding = 10;
    final Color indicatorColor = AppColors.primaryColor;
    final Color labelColor = AppColors.primaryColor;

    return DefaultTabController(
      length: tabs.length,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isTablet ? screenWidth * 0.04 : screenWidth * 0.02,
              vertical: screenHeight * 0.03,
            ),
            child: TabBar(
              physics: NeverScrollableScrollPhysics(),
              tabAlignment: TabAlignment.start,
              isScrollable: tabs.length > 3 ? true : false,
              indicator: CustomUnderlineTabIndicator(
                width: screenWidth * 0.04,
                height: screenHeight * 0.004,
                color: AppColors.primaryColor,
              ),
              labelColor: labelColor,
              unselectedLabelColor: AppColors.greyColor,
              labelStyle: AppTypography.title14PrimaryTextBold,
              unselectedLabelStyle: AppTypography.typo14PrimaryTextRegular,
              indicatorColor: indicatorColor,
              dividerColor: Colors.transparent,
              onTap: (int value) => {},
              tabs: List.generate(
                tabs.length,
                (int index) => Text(tabs[index], textAlign: TextAlign.left),
              ),
            ),
          ),
          Expanded(child: TabBarView(children: screens)),
        ],
      ),
    );
  }
}

class CustomUnderlineTabIndicator extends Decoration {
  final double width;
  final double height;
  final Color color;

  const CustomUnderlineTabIndicator({
    required this.width,
    required this.height,
    required this.color,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomUnderlinePainter(width: width, height: height, color: color);
  }
}

class _CustomUnderlinePainter extends BoxPainter {
  final double width;
  final double height;
  final Color color;
  final double spacing;

  _CustomUnderlinePainter({
    required this.width,
    required this.height,
    required this.color, // Default spacing value
    this.spacing = 6.0,
  });

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // final double startX = offset.dx +
    //     (configuration.size!.width / 2) -
    //     (width / 2); // Center the indicator
    final double startX = offset.dx + 0; // Align indicator to the start

    final double startY =
        offset.dy + configuration.size!.height - height + spacing;

    final Paint paint =
        Paint()
          ..color = color
          ..style = PaintingStyle.fill;

    canvas.drawRect(Rect.fromLTWH(startX, startY, width, height), paint);
  }
}
