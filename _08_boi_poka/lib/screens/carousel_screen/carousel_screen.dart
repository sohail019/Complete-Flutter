import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouselScreen extends StatefulWidget {
  const CarouselScreen({super.key});

  @override
  State<CarouselScreen> createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0.75,
            child: Container(
              width: 1,
              height: 0.75,
              color: AppColors.pokaLineColor,
            ),
          ),
          Positioned(
            right: 18.0,
            top: 0.63,
            child: Image.asset(
              AppImages.upsideDownWorm,
              height: 240,
              width: 240,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 10,
            child: Center(child: Text("Carousel Screen")),
          ),
        ],
      ),
    );
  }
}
