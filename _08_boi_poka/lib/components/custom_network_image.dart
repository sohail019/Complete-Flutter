import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double height;

  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    this.width = 104,
    this.height = 100,
  });

  @override
  Widget build(BuildContext context) {
    return (imageUrl != null)
        ? CachedNetworkImage(
          imageUrl: imageUrl!,
          fit: BoxFit.fill,
          width: width?.w,
          height: height.h,
          placeholder: (context, url) {
            return Skeletonizer(enabled: true, child: Container(width: width));
          },
          errorWidget:
              (context, url, error) => Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Image.asset(
                  AppImages.wormLogo,
                  height: height.h,
                  width: width?.w,
                ),
              ),
        )
        : Image.asset(AppImages.wormLogo, height: height.h, width: width?.w);
  }
}
