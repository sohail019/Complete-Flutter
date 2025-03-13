import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSliderWidget extends StatefulWidget {
  final String? title;
  final Color? thumbColor;
  final double value;
  final ValueChanged<double> onChanged;
  final double min;
  final double max;
  final String variant;
  final String bookId;
  final ValueChanged<double>? onChangeEnd;
  const CustomSliderWidget({
    super.key,
    this.title,
    this.thumbColor,
    required this.value,
    required this.onChanged,
    this.min = 0,
    this.max = 100,
    this.variant = "default",
    required this.bookId,
    this.onChangeEnd,
  });

  @override
  State<CustomSliderWidget> createState() => _CustomSliderWidgetState();
}

class _CustomSliderWidgetState extends State<CustomSliderWidget> {
  final double _sliderValue = 20;

  @override
  Widget build(BuildContext context) {
    final tickIconSize = 26.w;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Padding(
            padding: EdgeInsets.only(left: 18.w),
            child: Text(
              widget.title!,
              style: AppTypography.typo16PrimaryTextRegular,
            ),
          ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: widget.variant == "no-label" ? 0 : 2.h,
                ),
                child:
                    widget.variant == "no-label"
                        ? SizedBox(
                          height: 40.h,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                left: -20.w,
                                right: 0,
                                top: 0,
                                child: SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                    activeTrackColor: AppColors.pallete4,
                                    allowedInteraction:
                                        SliderInteraction.slideOnly,
                                    inactiveTrackColor: Colors.grey.shade300,
                                    activeTickMarkColor: Colors.transparent,
                                    trackHeight: 5.h,
                                    overlayShape:
                                        SliderComponentShape.noOverlay,
                                    thumbShape: CustomSliderThumbWithoutLabel(),
                                  ),
                                  child: Slider(
                                    value: widget.value,
                                    onChanged: widget.onChanged,
                                    min: widget.min,
                                    max: widget.max,
                                    onChangeEnd: widget.onChangeEnd,
                                    divisions: 4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                        : SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: AppColors.primaryColor,
                            allowedInteraction: SliderInteraction.slideOnly,
                            inactiveTrackColor: Colors.grey.shade300,
                            activeTickMarkColor:
                                Colors.transparent, // Hide active tick marks
                            inactiveTickMarkColor: Colors.transparent,
                            trackHeight: 11.h,
                            overlayShape: SliderComponentShape.noOverlay,
                            thumbShape: CustomSliderThumbWithLabel(
                              value: _sliderValue,
                              thumbColor:
                                  widget.thumbColor ?? AppColors.primaryColor,
                            ),
                          ),
                          child: Slider(
                            value: widget.value,
                            onChanged: widget.onChanged,
                            min: widget.min,
                            max: widget.max,
                          ),
                        ),
              ),
            ),
            if (widget.value != widget.max && widget.variant != "no-label")
              SizedBox(
                width: 28.w,
                child: Text(
                  "${widget.value.toInt()}%",
                  style: AppTypography.typo12PrimaryTextRegular,
                  textAlign: TextAlign.right,
                ),
              ),
            if (widget.value == widget.max && widget.variant == "no-label")
              SizedBox(
                width: 28.w,
                child: Image.asset(
                  AppImages.completed,
                  width: tickIconSize,
                  height: tickIconSize,
                  fit: BoxFit.contain,
                  color: AppColors.pallete4,
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class CustomSliderThumbWithLabel extends SliderComponentShape {
  final double value;
  final Color thumbColor;

  const CustomSliderThumbWithLabel({
    required this.value,
    required this.thumbColor,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size(50, 50);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required Size sizeWithOverflow,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double textScaleFactor,
    required double value,
  }) {
    final Canvas canvas = context.canvas;

    final paint =
        Paint()
          ..color = thumbColor
          ..style = PaintingStyle.fill;

    canvas.drawCircle(center, 20, paint);

    TextSpan span = TextSpan(
      style: AppTypography.typo16TertiaryTextBold,
      text: (value * 10).toStringAsFixed(0),
    );

    TextPainter tp = TextPainter(text: span, textDirection: textDirection);
    tp.layout();
    tp.paint(canvas, center - Offset(tp.width / 2, tp.height / 2));
  }
}

class CustomSliderThumbWithoutLabel extends SliderComponentShape {
  const CustomSliderThumbWithoutLabel();

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size(60, 60);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required Size sizeWithOverflow,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double textScaleFactor,
    required double value,
  }) {
    final Canvas canvas = context.canvas;

    // Outer white circle with shadow
    final shadowPaint =
        Paint()
          ..color = Colors.black.withValues(
            red: 0,
            green: 0,
            blue: 0,
            alpha: 0.1 * 255,
          )
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);
    canvas.drawCircle(center, 2, shadowPaint);

    // Outer white circle
    final outerCirclePaint =
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill;
    canvas.drawCircle(center, 15, outerCirclePaint);

    // Inner black circle
    final innerCirclePaint =
        Paint()
          ..color = Colors.black
          ..style = PaintingStyle.fill;
    canvas.drawCircle(center, 10, innerCirclePaint);
  }
}
