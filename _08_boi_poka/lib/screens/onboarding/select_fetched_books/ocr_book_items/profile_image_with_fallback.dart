import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImageWithFallback extends StatelessWidget {
  final String? imageUrl;
  final String? userNameInit;
  final double width; // Width of the rectangular image
  final double height; // Height of the rectangular image
  final double borderRadius; // Border radius for rounded corners

  const ProfileImageWithFallback({
    super.key,
    this.imageUrl,
    this.userNameInit,
    this.width = 100.0, // Default width
    this.height = 100.0, // Default height
    this.borderRadius = 10.0, // Default border radius
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.borderPrimaryColor, // Background color
        borderRadius: BorderRadius.circular(
          borderRadius.r,
        ), // Apply border radius
      ),
      width: width.w,
      height: height.h,
      // Background color in case of no image
      child:
          imageUrl == null || imageUrl!.isEmpty
              ? userNameInit == null
                  ? Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.borderPrimaryColor, // Border color
                        width: 1.0, // Border width
                      ),
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(borderRadius),
                      // Ensures the image corners are rounded
                      child: Image.asset(
                        AppImages.wormLogo,
                        fit: BoxFit.contain,
                        width: width.w,
                        height: height.h,
                      ),
                    ),
                  )
                  : Center(
                    child: Text(
                      userNameInit ?? '',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ) // Show initials if no image
              : ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius),
                // Ensures the image corners are rounded
                child: CachedNetworkImage(
                  imageUrl: imageUrl!,
                  fit: BoxFit.contain,
                  placeholder:
                      (context, url) => Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            AppColors.primaryColor,
                          ),
                        ),
                      ), // Show a loading spinner while loading
                  // errorWidget: (context, url, error) => Icon(
                  //   Icons.account_circle,
                  //   size: width,
                  //   color: Colors.white,
                  // ), // Show default icon if image fails to load
                  errorWidget:
                      (context, url, error) => Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.borderPrimaryColor, // Border color
                            width: 1.0, // Border width
                          ),
                          borderRadius: BorderRadius.circular(borderRadius),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(borderRadius),
                          // Ensures the image corners are rounded
                          child: Image.asset(
                            AppImages.wormLogo,
                            fit: BoxFit.contain,
                            width: width.w,
                            height: height.h,
                          ),
                        ),
                      ), // Show default icon if image fails to load
                ),
              ),
    );
  }
}
