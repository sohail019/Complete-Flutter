import 'package:_08_boi_poka/components/custom_checkbox_widget.dart';
import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:_08_boi_poka/models/ocr_book_model.dart';
import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";

import 'profile_image_with_fallback.dart';

class OCRBookItem extends StatefulWidget {
  final OcrBook ocrBookData;
  final Function(BookData itemId) onItemClick;
  final Function(bool isChecked) onCheckboxChanged;

  const OCRBookItem({
    super.key,
    required this.ocrBookData,
    required this.onItemClick,
    required this.onCheckboxChanged,
  });

  @override
  _OCRBookItemState createState() => _OCRBookItemState();
}

class _OCRBookItemState extends State<OCRBookItem> {
  @override
  Widget build(BuildContext context) {
    OcrBook ocrBookData = widget.ocrBookData;
    bool isBookFound = ocrBookData.found;
    BookData? bookData = ocrBookData.data;

    String? bookTitle = bookData?.title ?? "NA";
    String bookAuthor = bookData?.author?.join(", ") ?? "NA";
    String? coverImageUrl = bookData?.coverImage ?? "";

    @override
    void initState() {
      super.initState();
      // Set the bookAuthor based on the widget.type value
    }

    return Column(
      children: [
        ListTile(
          // minVerticalPadding: 8.0,  // Adjusting the minimum vertical padding
          // horizontalTitleGap: 10.w,
          contentPadding: EdgeInsets.only(
            top: 5.h,
            bottom: 5.h,
            left: 10.w,
            right: 8.w,
          ), // Increased vertical padding
          title: Text(
            bookTitle,
            style: AppTypography.typo14Height12PrimaryTextRegular,
          ),
          subtitle: Text(
            bookAuthor,
            style: AppTypography.typo12QuadTextRegular,
          ),
          leading: ProfileImageWithFallback(
            imageUrl:
                coverImageUrl.isNotEmpty
                    ? coverImageUrl
                    : null, // Your image URL
            userNameInit: null, // Optional initials (if no image)
            width: 30, // Set custom width
            height: 50, // Set custom height
            borderRadius: 0, // Set custom border radius
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min, // Keeps trailing items to the right
            children: [
              CustomCheckboxWidget(
                value: ocrBookData.isChecked,
                onChanged: (bool? newValue) {
                  if (isBookFound) {
                    widget.onCheckboxChanged(!ocrBookData.isChecked);
                  }
                },
              ),
            ],
          ),
          onTap: () {
            if (isBookFound) {
              widget.onItemClick(bookData!);
              // widget.onCheckboxChanged(!ocrBookData.isChecked);
            }
          },
        ),
        Container(height: 0.5.h, color: AppColors.dividerColor),
      ],
    );
  }
}
