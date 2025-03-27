import 'package:_08_boi_poka/components/adaptive_button.dart';
import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";

class BookInfo extends StatefulWidget {
  final Map<String, dynamic> bookDetails;
  const BookInfo({required this.bookDetails, super.key});

  @override
  _BookInfoState createState() => _BookInfoState();
}

class _BookInfoState extends State<BookInfo> {
  bool isExpanded = false;
  bool isOverflowing = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkIfTextOverflows();
    });
  }

  void _checkIfTextOverflows() {
    final text = widget.bookDetails['description'] ?? '';
    final textStyle = AppTypography.typo12PrimaryTextLight;

    final textPainter = TextPainter(
      text: TextSpan(text: text, style: textStyle),
      maxLines: 5,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: MediaQuery.of(context).size.width - 110.w);

    setState(() {
      isOverflowing = textPainter.didExceedMaxLines;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final isTablet = View.of(context).physicalSize.shortestSide /
    //         View.of(context).devicePixelRatio >=
    //     680;
    // var orientation = MediaQuery.of(context).orientation;
    final author =
        widget.bookDetails['authors'].isNotEmpty
            ? widget.bookDetails['authors'][0]
            : "Not Available";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 76.w, right: 34.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.bookDetails['title'],
                style: AppTypography.title40PrimaryTextBold,
              ),
              SizedBox(height: 10.h),
              Text(author, style: AppTypography.typo14PrimaryTextRegular),
              SizedBox(height: 20.h),
              AnimatedCrossFade(
                duration: Duration(milliseconds: 300),
                crossFadeState:
                    isExpanded
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                firstChild: Column(
                  children: [
                    Text(
                      widget.bookDetails['description'],
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                      style: AppTypography.typo12PrimaryTextLight,
                    ),
                    SizedBox(height: 5.h),
                  ],
                ),
                secondChild: Wrap(
                  children: [
                    Text(
                      widget.bookDetails['description'],
                      // overflow: TextOverflow.ellipsis,
                      style: AppTypography.typo12PrimaryTextLight,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.h),
            ],
          ),
        ),
        if (isOverflowing)
          Padding(
            padding: EdgeInsets.only(left: 54.w),
            child: AdaptiveButtonWidget(
              disabled: false,
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              title: isExpanded ? "less" : "more",
              iconImg: AppImages.moreIconHorizontal,
            ),
          ),
      ],
    );
  }
}
